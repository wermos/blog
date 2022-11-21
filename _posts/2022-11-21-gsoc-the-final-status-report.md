---
layout: single 
title:  "GSoC --- The Final Status Report"
date:   2022-11-21 20:19:56 +0530
toc: true
classes: wide
usecodehl: true
categories: gsoc
---

In this blog post, I will describe the work I have done after the midterm evalulation.

# Integrating Fastor

As I mentiond in the previous post, the next step was for me to fully integrate Fastor as a backend into `algebra-plugins`. To that end, I opened [PR #78](https://github.com/acts-project/algebra-plugins/pull/78).

## `algebra-plugins` Architecture

Integrating Fastor into `algebra-plugins` was not an easy feat. The architecture of `algebra-plugins` is quite complicated and very C++ template-heavy (in order to minimize code duplication). Moreover, there are many things which do not make sense to a beginner.
