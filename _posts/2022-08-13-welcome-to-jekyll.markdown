---
layout: single 
title:  "First blog post"
date:   2022-08-13 18:36:50 +0530
categories: jekyll update
usemathjax: true
---
You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

Jekyll requires blog post files to be named according to the following format:

`YEAR-MONTH-DAY-title.MARKUP`

Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit numbers, and `MARKUP` is the file extension representing the format used in the file. After that, include the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

Here is my first thing on my own blog. Here is a C++ code snippet:
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
concept Addable = requiries (T a, T b) {
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

Here is a $$\LaTeX$$ math snippet:

$$\displaystyle \int_\Omega X\mathrm{d}\mu$$

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
