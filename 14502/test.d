import std.conv;
import std.algorithm: canFind;
import std.array;
import std.stdio;

final class BasicBlock {
  BasicBlock[] inEdges;
  BasicBlock[] outEdges;
  int name;

  this(int _name) pure @safe { name = _name; }
}

struct BasicBlockEdge {
  BasicBlock from;
  BasicBlock to;

  @safe pure:
  this(CFG cfg, int fromName, int toName) {
    from = cfg.createNode(fromName);
    to = cfg.createNode(toName);
    from.outEdges ~= to;
    to.inEdges ~= from;
    cfg.addEdge(this);
  }
}

final class CFG {
  BasicBlock[int] basicBlockMap;
  BasicBlockEdge[] edgeList;
  BasicBlock startNode;

  pure @safe:
  BasicBlock createNode(int name) {
    BasicBlock node = basicBlockMap.get(name, null);

    if (node is null) {
      node = new BasicBlock(name);
      basicBlockMap[name] = node;
    }

    if (startNode is null) startNode = node;
    return node;
  }

  void addEdge(BasicBlockEdge edge) { edgeList ~= edge; }
  int getNumNodes() { return to!int(basicBlockMap.length); }
}

final class SimpleLoop {
  bool[BasicBlock] basicBlocks;
  bool[SimpleLoop] children;
  bool isRoot;
  bool isReducible;
  int counter;
  int nestingLevel;
  int depthLevel;
  SimpleLoop parent;
  BasicBlock header;

  pure @safe:
  this() {
    parent = null;
    header = null;
    counter = 0;
    depthLevel = 0;
    nestingLevel = 0;
    isRoot = false;
    isReducible = true;
  }

  void addNode(BasicBlock bb) { basicBlocks[bb] = true; }
  void addChildLoop(SimpleLoop loop) { children[loop] = true; }

  void setParent(SimpleLoop p) {
    parent = p;
    parent.addChildLoop(this);
  }

  void setHeader(BasicBlock bb) {
    basicBlocks[bb] = true;
    header = bb;
  }

  void setNestingLevel(int level) {
    nestingLevel = level;
    if (level == 0) isRoot = true;
  }
}

static int loopCounter = 0;

final class LSG {
  SimpleLoop[] loops;
  SimpleLoop root;

  @safe:
  this() {
    root = createNewLoop();
    root.setNestingLevel(0);
    addLoop(root);
  }

  SimpleLoop createNewLoop() {
    SimpleLoop s = new SimpleLoop;
    loopCounter += 1;
    s.counter = loopCounter;
    return s;
  }

  @safe pure:
  void addLoop(SimpleLoop loop) { loops ~= loop; }
  int getNumLoops() { return to!int(loops.length); }
}

class UnionFindNode {
  UnionFindNode parent;
  BasicBlock bb;
  SimpleLoop loop;
  int dfsNumber;

  UnionFindNode findSet() {
    UnionFindNode[] nodeList;
    UnionFindNode node = this;

    while (node != node.parent) {
      parent = node.parent;
      if (parent != parent.parent) { nodeList ~= node; }
      node = parent;
    }

    foreach(iter; nodeList) { iter.parent = node.parent; }
    return node;
  }

  @safe pure nothrow:
  this() {
    bb = null;
    parent = null;
    loop = null;
    dfsNumber = 0;
  }

  void initNode(BasicBlock _bb, int dfs) {
    parent = this;
    bb = _bb;
    dfsNumber = dfs;
  }

  void union_parent(UnionFindNode ufn) {
    parent = ufn;
  }
}

final class HavlakLoopFinder {
  CFG cfg;
  LSG lsg;

  enum UNVISITED = -1;
  enum BB_TOP = 0;
  enum BB_NONHEADER = 1;
  enum BB_REDUCIBLE = 2;
  enum BB_SELF = 3;
  enum BB_IRREDUCIBLE = 4;
  enum BB_DEAD = 5;
  enum BB_LAST = 6;
  enum MAXNONBACKPREDS = (32 * 1024);

  pure nothrow
  {
    this(CFG _cfg, LSG _lsg) {
        cfg = _cfg;
        lsg = _lsg;
    }

    bool isAncestor(int w, int v, int[] last) {
        return (w <= v) && (v <= last[w]);
    }

    int DSF(BasicBlock currentNode, UnionFindNode[] nodes, int[BasicBlock] number, int []last, int current) {
        nodes[current].initNode(currentNode, current);
        number[currentNode] = current;
        int lastid = current;

        foreach(target; currentNode.outEdges) {
        if (number[target] == UNVISITED) {
            lastid = DSF(target, nodes, number, last, lastid + 1);
        }
        }

        last[number[currentNode]] = lastid;
        return lastid;
    }
  }

  int findLoops() {
    BasicBlock startNode = cfg.startNode;
    if (!startNode) return 0;

    int size = cfg.getNumNodes();

    bool[int][] non_back_preds;
    int[][] back_preds;
    int[] header;
    int[] types;
    int[] last;
    UnionFindNode[] nodes;
    int[BasicBlock] number;

    foreach (_; 0..size) {
      bool[int] newset;
      non_back_preds ~= newset;
      int[] newarr;
      back_preds ~= newarr;
      header ~= 0;
      types ~= 0;
      last ~= 0;
      nodes ~= new UnionFindNode();
    }

    foreach( k, v; cfg.basicBlockMap) { number[v] = UNVISITED; }
    DSF(startNode, nodes, number, last, 0);

    foreach (w; 0..size) {
      header[w] = 0;
      types[w] = BB_NONHEADER;

      auto nodeW = nodes[w].bb;

      if (nodeW) {
        foreach (nodeV; nodeW.inEdges) {
          auto v = number[nodeV];
          if (v != UNVISITED) {
            if (isAncestor(w, v, last)) {
              back_preds[w] ~= v;
            } else {
              non_back_preds[w][v] = true;
            }
          }
        }
      } else {
        types[w] = BB_DEAD;
      }
    }

    header[0] = 0;

    foreach_reverse (w; 0 .. size) {
      UnionFindNode[] nodePool;

      auto nodeW = nodes[w].bb;
      if (nodeW) {
        foreach(v; back_preds[w]) {
          if (v != w)
            nodePool ~= nodes[v].findSet;
          else
            types[w] = BB_SELF;
        }

        auto workList = nodePool.dup;

        if (nodePool.length != 0) types[w] = BB_REDUCIBLE;

        while (!workList.empty) {
          auto x = workList[0];
          workList.popFront();

          auto nonBackSize = non_back_preds[x.dfsNumber].length;
          if (nonBackSize > MAXNONBACKPREDS) return 0;

          foreach(iter; non_back_preds[x.dfsNumber]) {
            auto y = nodes[iter];
            auto ydash = y.findSet;

            if (!isAncestor(w, ydash.dfsNumber, last)) {
              types[w] = BB_IRREDUCIBLE;
              non_back_preds[w][ydash.dfsNumber] = true;
            } else {
              if (ydash.dfsNumber != w && !nodePool.canFind(ydash)) {
                workList ~= ydash;
                nodePool ~= ydash;
              }
            }
          }
        }

        if ((nodePool.length > 0) || (types[w] == BB_SELF)) {
          auto loop = lsg.createNewLoop;
          loop.setHeader(nodeW);
          loop.isReducible = (types[w] != BB_IRREDUCIBLE);

          nodes[w].loop = loop;

          foreach(node; nodePool) {
            header[node.dfsNumber] = w;
            node.union_parent(nodes[w]);

            if (node.loop) node.loop.setParent(loop); else loop.addNode(node.bb);
          }

          lsg.addLoop(loop);
        }
      }
    }
    return lsg.getNumLoops();
  }
}

int findHavlakLoops(CFG cfg, LSG lsg)
{
    scope h = new HavlakLoopFinder(cfg, lsg);
    return h.findLoops();
}

int findHavlakLoops(CFG cfg)
{
    scope lsg = new LSG();
    return findHavlakLoops(cfg, lsg);
}

final class LoopTesterApp {
  CFG cfg;
  LSG lsg;

  this() @safe {
    cfg = new CFG();
    lsg = new LSG();
  }

  @safe pure
  {
    int buildDiamond(int start) {
        int bb0 = start;
        new BasicBlockEdge(cfg, bb0, bb0 + 1);
        new BasicBlockEdge(cfg, bb0, bb0 + 2);
        new BasicBlockEdge(cfg, bb0 + 1, bb0 + 3);
        new BasicBlockEdge(cfg, bb0 + 2, bb0 + 3);
        return bb0 + 3;
    }

    void buildConnect(int _start, int _end) {
        new BasicBlockEdge(cfg, _start, _end);
    }

    int buildStraight(int start, int n) {
        foreach(i; 0..n) {
        buildConnect(start + i, start + i + 1);
        }
        return start + n;
    }

    int buildBaseLoop(int from) {
        auto header   = buildStraight(from, 1);
        auto diamond1 = buildDiamond(header);
        auto d11      = buildStraight(diamond1, 1);
        auto diamond2 = buildDiamond(d11);
        auto footer   = buildStraight(diamond2, 1);

        buildConnect(diamond2, d11);
        buildConnect(diamond1, header);

        buildConnect(footer, from);
        return buildStraight(footer, 1);
    }
  }

  void run() {
    cfg.createNode(0);
    buildBaseLoop(0);
    cfg.createNode(1);
    buildConnect(0, 2);

    foreach(_; 0..15000) findHavlakLoops(cfg);

    int n = 2;

    foreach(parlooptrees; 0..10) {
      cfg.createNode(n + 1);
      buildConnect(2, n + 1);
      n = n + 1;

      foreach(i; 0..100) {
        int top = n;

        n = buildStraight(n, 1);
        foreach(_; 0..25) { n = buildBaseLoop(n); }

        int bottom = buildStraight(n, 1);
        buildConnect(n, top);
        n = bottom;
      }
      buildConnect(n, 1);
    }

    int loops = findHavlakLoops(cfg);
    int sum = 0;
    foreach (_; 0..50) {
      write(".");
      stdout.flush();
      sum += findHavlakLoops(cfg);
    }
    writefln("\nFound %d loops (including artificial root node) (%d)", loops, sum);
  }
}

int main() {
  auto l = new LoopTesterApp();
  l.run();
  return 0;
}
