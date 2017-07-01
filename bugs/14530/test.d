void main () {
  import core.time;
  auto t = TickDuration.from!"seconds"(1000);
  auto n = t.to!("msecs", float);
}
