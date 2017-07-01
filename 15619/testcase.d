import std.stdio;
import std.math;

double expDecayFactor(double time, double samplerate) pure nothrow @nogc
{
    return 0.00045341191;
}

void processAudio(float* outputs, int frames)
{   
    float[] _mono;
    float[] _distancedL, _distancedR;    

    _mono = new float[frames];
    _distancedL = new float[frames];
    _distancedR = new float[frames];

    ExpSmoother smoother;

    smoother.initialize(86.0f, 0.05f, 0.05f, 1);

    _distancedL[] = 0;
    _distancedR[] = 0;

    float level = smoother.nextSample();

    _mono[0..frames] = (_distancedL[0..frames] + _distancedR[0..frames]);

    for (int i = 0; i < frames; ++i)
    {
        outputs[i] = level;
    }        
}

struct ExpSmoother
{
public:
    void initialize(float samplerate, float timeAttack, float timeRelease,
float initialValue)
    {
        assert(isFinite(initialValue));

        _current = cast(float)(1);

        _expFactorAttack = cast(float)(expDecayFactor(timeAttack, 44100.0f));
        _expFactorRelease = _expFactorAttack;
        assert(isFinite(_expFactorAttack));
        assert(isFinite(_expFactorRelease));
    }

    float nextSample()
    {
        float target = 1;
        float diff = target - _current;
        if (diff != 0)
        {
            writeln("never passing here");
            double expFactor = (diff > 0) ? _expFactorAttack :
_expFactorAttack;
            double temp = _current + diff * expFactor;
            float newCurrent = cast(float)(temp);
            _current = newCurrent;            
        }
        return _current;
    }

private:
    float _current;
    float _expFactorAttack;
    float _expFactorRelease;
}

void main()
{
    float[] buf = new float[16]; // must be >= 16

    processAudio(buf.ptr, 16); // must be >= 16

    writeln(buf);
}
