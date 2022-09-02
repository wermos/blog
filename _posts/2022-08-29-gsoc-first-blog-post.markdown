---
layout: single 
title:  "GSoC --- First Blog Post"
date:   2022-08-29 02:54:55 +0530
categories: gsoc
---

This is my first GSoC blog post, where I talk about what GSoC is, what organization I am working with, and what the software project I am working on actually does.

# What is GSoC?

GSoC is short for Google Summer of Code. Here is a quote from the official webpage, which explains the entire thing pretty well:
> Google Summer of Code is a global, online program focused on bringing new contributors into open source software development. GSoC Contributors work with an open source organization on a 12+ week programming project under the guidance of mentors.

For more information, check out their [webpage](https://summerofcode.withgoogle.com/).

# My GSoC Project

## My Organization

GSoC Contributors are paired up with an organization, who are the people who want the specific project (that you choose to work on) to be done. I was selected to work with [CERN-HSF](https://summerofcode.withgoogle.com/programs/2022/organizations/cern-hsf), and my project falls under the purview of the [ACTS Project](https://github.com/acts-project/acts).

## What is the ACTS Project?

Once again, if we take a look at the [README.md](https://github.com/acts-project/acts/blob/main/README.md), we see that
> Acts is an experiment-independent toolkit for (charged) particle track reconstruction in (high energy) physics experiments implemented in modern C++.

### But What Does That Mean?

When CERN conducts experiments at the [Large Hadron Collider](https://home.cern/science/accelerators/large-hadron-collider) (LHC), the 8 detectors present record certain types of data. The ACTS project is only concerned with the data gathered by the [ATLAS detector](https://atlas.cern/).

{% figure  [caption:"A diagram of the LHC and the 8 detectors. Picture Credits: [Wikipedia](https://en.wikipedia.org/wiki/Large_Hadron_Collider#/media/File:LHC.svg)"] %}
![diagram of the LHC and the 8 detectors]({{ "/assets/images/LHC.svg" | relative_url }})
{% endfigure %}

### What is Track Fitting?

One of things mentioned in the ACTS project's README is [track reconstruction](https://en.wikipedia.org/wiki/Tracking_(particle_physics)). This consists of two parts: First, when a particle interacts with a certain detector geometry, the detector records it for further analysis. Then, the software takes all the gathered points where the particle was known to be at, and recreates the path that the particle must have taken.

### How Is This Done?

One thing to keep in mind is that in the real world, we do not (and cannot) have a perfect knowledge of the exact location the particle hit a detector geometry. What we actually have is a location and an error bound, and the software has to take this error bound into account as well.

One of the ways to do this kind of track fitting, is to make use of a statistical technique known as [Kalman Filtering](https://en.wikipedia.org/wiki/Kalman_filter).

In the next blog post, I will explain what my work is, and how all this ties into my GSoC project.
