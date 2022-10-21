---
layout: single 
title:  "First Blog Post"
date:   2022-08-13 18:36:50 +0530
usemathjax: true
usecodehl: true
---

Here is my first thing on my own blog.


Here is a C++ code snippet:
{% highlight cpp %}
#include <iostream>

int main() {
	std::cout << "Hello world\n";
}
{% endhighlight %}

Here is a slightly more complicated C++ snippet, using C++20 keywords:
{% highlight cpp %}
#include <iostream>

template <typename T>
concept Addable = requires (T a, T b) {
	a + b;
};

template <typename T>
T add(T a, T b) requires Addable<T> {
	return a + b;
}

int main() {
	int result = add(4, 5);
	std::cout << result << '\n';
}
{% endhighlight %}

Here is a $\LaTeX$ math snippet:

$$\int_\Omega X\mathrm{d}\mu$$

$$I_n = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix}$$

Some inline $\mathrm{M}\mathcal{A}\mathfrak{T}\mathsf{H}$ for fun, and a Rust code snippet:
{% highlight rust %}
fn main() {
	println!("Hello world!");
}
{% endhighlight %}

Some Python:
{% highlight python %}
import math

def fun():
	pass
{% endhighlight %}

Now, it's time for an image:
![ray-traced image]({{ "/assets/images/test.png" | relative_url }})

Testing no line numbers:
{% noln cpp %}
#include <iostream>

int main() {
	std::cout << "Never gonna give you up,\n";
	std::cout << "Never gonna let you down.\n";
}
{% endnoln %}

{% noln python %}
import math

def fun():
	pass
{% endnoln %}

Testing starting line numbers from an arbitrary number:
{% highlight cpp start=5 %}
#include <iostream>

void print() {
	std::cout << "And this, is to go,\n";
	std::cout << "even further, beyond!\n";
}
{% endhighlight %}

This is a picture of Zhongli (from Genshin Impact) picture:
![Zhongli](https://static.wikia.nocookie.net/gensin-impact/images/c/c4/Character_Zhongli_Full_Wish.png/)

A Naruto (Shippuuden) GIF (for testing if GIFs work, and figuring out how to include GIFs in blog posts):
<div style='position:relative; padding-bottom:calc(56.25% + 44px)'><iframe src='https://gfycat.com/ifr/search/EarnestMeanKingbird?controls=0&hd=1' frameborder='0' scrolling='no' width='100%' height='100%' style='position:absolute;top:0;left:0;' allowfullscreen title="Naruto vs. Sasuke v2"></iframe></div>

