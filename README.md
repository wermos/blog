# Blog

This repository hosts the source code for my blog.

I am using Jekyll to write my blog. The `main` branch has the source code (the CSS and JavaScript modifications), as well as the blog content. The posts are in `.markdown` files.

The actual site code is in the `gh-pages` branch. Upon pushing to the `main` branch, GitHub Actions runs Jekyll and pushes the artifacts to the `gh-pages` branch, which is used for the hosted stuff.
