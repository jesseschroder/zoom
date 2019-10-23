final float[] numberOfAttempts = {
    10,
    100,
    1000,
    10000,
    100000,
    1000000
};
final float[] attemptFloat = {
    0.75,
    0.17,
    0.99,
    0.83,
    0.47,
    0.05
};

int attemptCount = numberOfAttempts.length;

void setup() {
    for (int i = 0; i < numberOfAttempts.length; i++) {
        int trueCount = 0;
        for (int runCount = 0; runCount < numberOfAttempts[i]; runCount++) {
            if (randomBool(attemptFloat[i])) trueCount += 1;
        }
    float percentage = (i == 0) ? 0 : (trueCount * 100)/numberOfAttempts[i];
    println(attemptFloat[i] + " float check on " + numberOfAttempts[i] + " number of attempts, " + trueCount + " were true or " + percentage + "%" );
    }
}

boolean randomBool(float p) {
    return random(1) <= p; 
}