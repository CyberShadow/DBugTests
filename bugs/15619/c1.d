import std.stdio;

void fillWithOnes(float* outputs, int frames)
{   
    float[] A = new float[frames];
    float[] B = new float[frames];

    A[] = 0;
    B[] = 0;

    float one = returnOne();

    A[0..frames] += B[0..frames];

    for (int i = 0; i < frames; ++i)
    {
        outputs[i] = one;
    }        
}

float returnOne()
{
    return 1;
}

void main()
{
    float[] buf = new float[16]; 
    fillWithOnes(buf.ptr, 16);
    writeln(buf);
}
