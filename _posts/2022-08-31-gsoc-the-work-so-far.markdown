---
layout: single 
title:  "GSoC --- The Work So Far"
date:   2022-08-31 16:16:37 +0530
toc: true
classes: wide
usecodehl: true
categories: gsoc
---

In this blog post, I will discuss the work I have done so far, and what our future direction will be.

# Fast 5×5

In 2019, Hadrien worked with a PhD student to create [Fast 5×5](https://gitlab.in2p3.fr/CodeursIntensifs/Fast5x5), which was supposed to be a proof-of-concept demonstrating that the existing matrix routines in `Eigen` could be better optimized for small dimensions like 5×5.

## My Changes to Fast 5×5

The first thing my mentors recommended doing was to take a closer look at the repository and understand where we stand with respect to the work to be done.

After looking at `fast5x5.hpp` for a while, I decided that I should make some changes to make the benchmarking program faster and more reliable. So, I started making changes to the repository. I started off by removing the Docker stuff because I am not too familiar with it, and because it would not be necessary for the project.

After making a few changes, it became apparent that I needed somewhere to push my changes to, so that it was available for everyone to see and use. However, because the original project was on Gitlab, I could not fork it the way projects on GitHub can be forked. Instead, I pushed my copy of the Gitlab repository onto GitHub, and made sure to point to the original URL in my repository description. The original repository can be found [here](https://gitlab.in2p3.fr/CodeursIntensifs/Fast5x5), and my fork can be found [here](https://github.com/wermos/Fast5x5/).

### Installed vs. Vendored Libraries

Originally, the repository expected the user to have `Eigen` and `xsimd` installed. However, the existing `CMakeLists.txt` file downloaded Google Test from GitHub, thereby avoiding that library dependency.

In order to minimize library dependencies and make it easier for other people to run the benchmarks, I removed the reliance on user installations and opted to "vendor" the libraries along with the project. Even though both Fast5×5 and `algebra-plugins` both used CMake to download dependencies from GitHub, I chose the Git submodule approach because I was more familiar with the latter at the time. I added `Eigen`, `xsimd`, and GoogleTest as Git sumbodules. Furthermore, all subsequent additions (like Google Benchmark, `blaze`, and `Fastor`) were added as submodules to Fast5×5.

### `/usr/bin/time` vs. Google Benchmark

[[ start writing here. finish the /usr/bin/time vs google benchmark thing first. ]]

the benchmarking script used `/usr/bin/time` to time the code. However, since the code that is being benchmarked runs very fast, a dedicated library like [Google Benchmark](https://github.com/google/benchmark).

### Matrix Generation

A key part of the benchmarking code is the random matrix generation. Doing this properly is essential because otherwise, the compiler might figure out the fact that we have pre-computed matrices. Once it does so, it is free to calculate the results ahead of time, which would defeat the point of the benchmark. The original Fast 5×5 code was using index based operations to fill up the matrix, like so:
{% highlight cpp %}
float a[SIZE * SIZE];
float b[SIZE * SIZE];

// the BaseMatrix data type in fast5x5.hpp has a constructor
// that takes in C-style arrays. So, the code simply filled
// up two arrays and then made two BaseMatrix objects out
// of them.

for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
        a[i * SIZE + j] = i + j;
    }
}

for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
        float val;
        if (i == 0 && j == 1) val = -1;
        else if (i == 1 && j == 0) val = 1;
        else if (i > 1 && i == j && i % 2) val = -1;
        else if (i > 1 && i == j && !(i % 2)) val = 1;
        else val = 0;
        b[i * SIZE + j] = val;
    }
}
{% endhighlight %}
I rewrote the matrix generation code using the random number generators in the `<random>` header, and mimicked `Eigen`'s `Random()` implementation, which generates a random float in the range [-1, 1]:
{% highlight cpp %}
// random.hpp
#include <random>
#include <limits>

inline float randomFloat(float min, float max) {
    // Returns a random real in [min, max].
    static std::uniform_real_distribution<float> distribution(
        min, std::nextafter(max,
            std::numeric_limits<float>::infinity()
            )
        );

    static std::mt19937_64 generator;

    return distribution(generator);
}

// this is the matrix generation code
float a[SIZE * SIZE];

for (int i = 0; i < SIZE; i++) {
    for (int j = 0; j < SIZE; j++) {
        a[i * SIZE + j] = randomFloat(-1.0, 1.0);
    }
}
{% endhighlight %}
