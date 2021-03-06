---
layout: post
title: "A Comprehensive guide to Jekyll"
date: 2022-04-17
length: "Long"
---

Hello there, today, I'm going to show you how to make a Jekyll blog from scratch, and take you all the way through a fully realized blog, with a theme, and maybe some plugins installed, in other words, this is a comprehensive guide to Jekyll.

Sounds fun? All right, let's go.

## Table of contents:

- [Introduction](#introduction)
- [Cool features of Jekyll](#cool-features-of-jekyll)
- [But what's a static site?](#but-whats-a-static-site)
- [Before we jump in](#before-we-jump-in)
- [Making a bare-bones website](#making-a-bare-bones-website)
  - [Creating a brand new project](#creating-a-brand-new-project)
  - [Folder structure](#folder-structure)
  - [Running and checking our website](#running-and-checking-our-website)
- [Creating posts](#creating-posts)
  - [How to create a post](#how-to-create-a-post)
  - [Making a post](#making-a-post)
    - [The Front Matter](#the-front-matter)
    - [Making the rest of the post](#making-the-rest-of-the-post)
- [Organizing your posts](#organizing-your-posts)
- [Working with images](#working-with-images)
- [Tip: Working with drafts](#tip-working-with-drafts)
- [Customizing our blog, and applying a theme and a plugin](#customizing-our-blog-and-applying-a-theme-and-a-plugin)
  - [Getting rid of the placeholders](#getting-rid-of-the-placeholders)
  - [Editing our blog pages](#editing-our-blog-pages)
  - [Applying a theme and installing a plugin (optional)](#applying-a-theme-and-installing-a-plugin-optional)
  - [Installing a plugin](#installing-a-plugin)
    - [Before you install a theme](#before-you-install-a-theme)
    - [Installing a theme](#installing-a-theme)
    - [Doing some adjustments](#doing-some-adjustments)
- [Hosting the blog with Github Pages](#hosting-the-blog-with-github-pages)
  - [Creating an empty Github Repository](#creating-an-empty-github-repository)
  - [Setting up `jekyll-deploy-action`](#setting-up-jekyll-deploy-action)
  - [Creating `gh-pages` branch](#creating-gh-pages-branch)
  - [Uploading our project](#uploading-our-project)
  - [Going to our website](#going-to-our-website)
  - [Configuring `_config.yml`](#configuring-_configyml)
  - [Publishing our changes to our website](#publishing-our-changes-to-our-website)
- [Conclusion](#conclusion)
- [Sources](#sources)

## Introduction

In this post, I will show how I built this blog using `Jekyll`, a simple to use static site generator (I'll explain what's that soon).

And we'll use `Github Pages`, A service provided by Github that allows you to host for free a static website with a `github.io` domain.

I made this guide partially because I think resources on using Jekyll are a bit scarce, even though Jekyll is a great tool, it suffers from having little to no documentation, [Giraffe Academy's series is great.](https://www.youtube.com/playlist?list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB) But I don't think it covers every corner you need about Jekyll.

But anyways, let's start the guide!

## Cool features of Jekyll

- Jekyll's strongest point is being *flexible* and *easy* to use.
- Jekyll makes it very easy to make a blog with no code at all, but is also very flexible for more advanced customization.
- All it needs to make a blog post is a markdown file, and you can even include `HTML`, `CSS`, and `JS`.
- If you're not in the mood for making your own web pages, you can also install user-created themes and plugins, it's as easy as changing two lines.
- Since Jekyll is a *static site* generator, that means you're able to host it for *free* on Github Pages, actually Github itself [*recommends Jekyll*](https://www.youtube.com/watch?v=2MsN8gpT6jY) for their platform.

## But what's a static site?

Basically, we have two different types of websites, **static websites** and **dynamic websites**, their difference is simply on that static websites doesn't do anything besides serve the same web pages to all users, while dynamic websites can serve web pages with different content to the users, for example, display the user's username at the top of the page.

Like the name suggests, a static website is, well, static, everything is pre-baked, the website is going to display the same version of a page to everyone else.

Not being able to do any of that fancy stuff sounds limiting, but you're still able to make very functional websites like:

- A documentation website
- A blog website (like this one!)
- Any website that only needs to serve plain web pages to the user (like a homepage for a software)

And you have the added bonus that static websites, for not doing any extra work besides serving a web page for the user, you have the benefit of being *faster* and *secure*, and for a blog, this is the perfect solution.

## Before we jump in

Before we jump in, we need a few things installed:

- `Ruby` (An interpreted programming language)
- `Jekyll`
- `Bundler` (A ruby package that will install additional things for us)

To install `Ruby`, `Jekyll` and `Bundler`, follow the instructions inside [Jekyll's website.](https://jekyllrb.com/docs/installation/)

And if you want to host your blog on Github Pages:

- A `Github` account to host it on Github pages (obviously).
- `git` installed, ready to use with Github. If you're using git for the first time, you have to set the username and email, you'll just need to pull a terminal (or git bash) and type this, replacing your username and your email with your Github username and Github email:

    ```bash
    git config --global user.name "my_github_username"
    git config --global user.email "my_github_email"
    ```

     and you will also need to [set an ssh key for github.](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

## Making a bare-bones website

### Creating a brand new project

Now that we installed everything we needed, we can finally create the website, it's as simple as saying `jekyll new project`, because that's the command we're going to use to create the website folder.

Pull a terminal (if you're not used to a terminal, don't fret, it's not as scary as it looks) and type the following:

(Substitute 'name_of_your_project' for the name you want to give the folder).

```bash
jekyll new name_of_your_project
```

This creates a folder with our Jekyll project inside. Make sure to remember the name of your project, because we're going to enter this folder right after.

Now, to run the website, first we need to be on the project's folder.

To enter the folder, we're going to use the `cd` command (`cd` command works on Linux/Windows/Mac).

```bash
cd name_of_your_project
```

### Folder structure

The inside of the project's folder should be looking similar to this:

```bash
example/
????????? 404.html
????????? about.markdown
????????? _config.yml
????????? Gemfile
????????? Gemfile.lock
????????? index.markdown
????????? _posts
????????? _site
```

Here are the most importants files you may want to know:

- The `_site` folder basically contains the finished product of our blog, Since `_site` is the compiled blog, you won't need to edit this folder.

- The `_posts` folder stores all our blog posts, there's a default showcase post inside.

- `_config.yml` like the name suggests, contains the settings of our website, like name, description, plugins, themes, etc.

- `Gemfile` is a ruby file that basically stores the dependencies (other software that is required for our software to run) we need, like `Jekyll` or our blog's default theme `minima`.

### Running and checking our website

To run our website, simply type this:

```bash
jekyll serve
```

The command will spit you some information, and a link to open our glorious website, click on it, or just go to `localhost:4000` (or whatever link your website is set) on any browser, the website should look something like this:

![Homepage of our new Jekyll blog]({% file_link jekyll-new-project-showcase.png %})

We can see the styling that Jekyll applies on the homepage, along with some links, an about page, an RSS link, and some social media buttons, clicking on the article 'Welcome to Jekyll!' will lead you to this post:

![The default article on the brand new Jekyll blog]({% file_link jekyll-default-post.png %})

This page gives you a bit of an insight on how blog posts on Jekyll works.

Like a good detective sharp-eyed detective, we can also observe that the blog posts also have styling applied to them. There's a nice big title, there's a main bar showing the website's name, you can also see in the article's content some highlighted text.

So far, the website looks good, although the theme looks kinda bland, it would be nice to replace the placeholder names with the name of the website, we're gonna do that later.

## Creating posts

### How to create a post

Now we're going onto the meat and potatoes of Jekyll, how to create a post, and how to publish it.

We're going to use markdown to write our posts, but you can also just write a HTML file and it will work just fine.

Markdown is an excellent tool, markdown is like an potato, it's versatile, it's simple to use, loved by many, and like I said, with Jekyll, you're able to write HTML, CSS, *and even* JS, with Jekyll, here's an example:

<style>
    .button-square {
        display: flex;
        flex-direction: column;
        width: 100%;
        justify-content: center;
        align-items: center;
    }

    #blue-square {
        margin-top: 0.1in;
        margin-bottom: 0.1in;
        width: 1in;
        height: 1in;
        background: hsl(200, 50%, 60%);
    }
</style>

<script>
    // Hello there
    function buttonThingy() {
        var r = Math.round(Math.random()*256);
        var g = Math.round(Math.random()*256);
        var b = Math.round(Math.random()*256);

        var square = document.getElementById("blue-square");
        square.style.background = `rgb(${r}, ${g}, ${b})`;
    }
</script>

<div class="button-square">
    <div id="blue-square"></div>

<button onclick="buttonThingy()">Click me</button>
</div>

Pretty wild right?

Well, turns out, Jekyll also made posting on our blog super simple to do, if we examine the blog post in our website, you'll notice this piece of text:

> You???ll find this post in your `_posts` folder.

..and this other piece of text!

> Jekyll requires blog post files to be named according to the following format:
>
> `YEAR-MONTH-DAY-title.MARKUP`
>
> Where YEAR is a four-digit number, MONTH and DAY are both two-digit numbers, and MARKUP is the file extension representing the format used in the file. After that, include the necessary front matter.

It tells us how we're going to create a post, if you remember what I have said a while ago, all posts go into the `_posts` folder, in fact, we can go take a look and see that the default post is really there!

```bash
_posts/
????????? 2022-03-27-welcome-to-jekyll.markdown
```

The post also helps us by telling us how to format our file name: `YEAR-MONTH-DAY-title.MARKUP` first, the file name needs a date on when it was written in the format `YEAR-MONTH-DAY`, next, the blog title, separated from the date with an dash: `-title` and last, the file extension: `.MARKUP`.

(Take extra attention to the file name, if it's incorrectly named, the post may not show up in your site).

With this knowledge, we're able to start posting in our blog!

### Making a post

Let's create a markdown file for this named `1970-01-01-my-super-cool-title.md` inside the `_posts` folder, the `_posts` folder should look like this:

```bash
_posts/
????????? 1970-01-01-my-super-cool-title.md
????????? 2022-03-27-welcome-to-jekyll.markdown
```

With our new file now in the folder, let's edit it, and add some text needed to make it show on our website:

#### The Front Matter

In Jekyll, this is called the `Front Matter`, It contains information about our blog post, so Jekyll can use this special information and display it on our website, for the example, the date that it was written, the title, or even tags/categories. The front matter also needs to be between a pair of three dashed lines `---`.

The front matter is not actually written in markdown, it's written in a markup language called `YAML`.

You can add, remove, or even edit the information if you want, for example, if you change the title, Jekyll will update it with the new title. But you may not want to remove the layout parameter, as that tells Jekyll how this post is going to be stylized, if you remove it, the page is going to be really ugly.

```yaml
---
layout: post
title:  "Welcome to Jekyll!"
date:   2022-03-27 19:35:59 -0300
categories: jekyll update
---
```

So, let's add the front matter to our newly created file, let's edit the file and add the following lines:

But also let's add an extra parameter, called `coolness` just as an example:

```yaml
---
layout: post
title:  "My super cool title"
date:   1970-01-1 00:00:00 -0300
categories: jekyll cool-title
coolness: "too cool"
---
```

Now that we added a front matter to our file, Jekyll will automatically detect this new file, and update our website to show this new post, if you reload our home page, you'll see that the post now shows up, with our title, date, and everything!

![The blog's homepage showing a new post]({% file_link jekyll-new-post.png %})

As a side note, notice that the front matter also affects our URL, based on the information we have put in:

![An URL link]({% file_link jekyll-front-matter-url.png %})

Now, let's finish our post.

#### Making the rest of the post

Now let's add some basic markdown, and just for fun, let's add some HTML too.

```markdown
---
layout: post
title:  "My super cool title"
date:   1970-01-1 00:00:00 -0300
categories: jekyll cool-title
coolness: "too cool to handle"
---

# Hi, i'm a heading
<h1 style="color: blue;">Hey there, I'm a heading, but made out of HTML, and CSS!</h1>

<button onclick="alert(1)">I'm a button</button>
```

And it should look something like this:

![Our updated blog post]({% file_link jekyll-markdown-showcase.png %})

In this post, we added a normal markdown heading, and also, to show the features of adding HTML, we also added a stylized HTML heading, and a button with some JS functionality, all of this in a single markdown file, awesome right?

### Organizing your posts

Here's a quick tip on organizing posts, Jekyll actually lets you organize your posts in folders, as long as it's inside the `_posts` folder, so you don't have to work on one big folder with all your blog posts inside of it. So, for example, your `_posts` folder may look like this:

``` bash
_posts
????????? 1970-01-01-my-super-cool-title.md
????????? 2022-03-27-welcome-to-jekyll.markdown
????????? cooking (folder)
??????? ????????? 1970-01-01-cooking-food.md
????????? jekyll (folder)
??????? ????????? 1970-01-01-making-site-jekyll.md
????????? math-problems (folder)
??????? ????????? 1970-01-01-whats-2-plus-2.md
????????? python (folder)
    ????????? 1970-01-01-python-is-good.md
```

And it would behave exactly the same.

### Working with images

Working with images is pretty straight-foward in Jekyll, we can use the `link` tag, and work our way from  the project folder, till all the way to our image, for example:

If my image is here:

```
jekyll-blog/
  --/_posts
  --/_site
  --/assets
    --/jekyll-tutorial-1
      --/image.png <-- Here!
```

We can link it like this:

{% raw %}
```liquid
{% link /assets/jekyll-tutorial-1/image.png %}
```
{% endraw %}

..But that can be quite repetitive and get pretty long as our project grows!

If we want to group our posts and assets in categories, suddenly, we need to replace every image link we had so far!

As far as I know, there are two plugins designed to help you with this kind of problem:

- **jekyll-postfiles** (Recommended):

    This is the easiest to use, all that this plugin does is allow you to put your assets together with your posts in the `_posts` folder, for example, if you want a project structure like this:

    ```
    jekyll-blog/
      --/_posts
        --/my-super-cool-post
          --/1970-01-01-my-super-cool-post.md <-- Your post
          --/my-cool-image.png
          --/my-other-cool-image.png
          --/my-cool-script.js
    ```

    That allows you to link your assets as easy as this:

    ```markdown
    <img src="my-other-cool-image.png">
    ![](my-cool-image.png)
    ```

    Then I really recommend `jekyll-postfiles`. check the install instructions in the repo.

    `jekyll-postfiles`'s repo: [https://github.com/nhoizey/jekyll-postfiles](https://github.com/nhoizey/jekyll-postfiles)

- **jekyll-file-link**:

    Ok, I just want to say right away that this is actually my plugin, I really liked `jekyll-postfiles`, but I don't think it fits for my blog, as my blog is very image-heavy, I would like a separate folder for my assets.

    `jekyll-file-link` automatically searches for your post's assets folder, but that requires a bit of a *strict* folder structure.

    If you like your project to be structured like this:

    ```
    jekyll-blog/
      --/posts
        --/my-cool-post
      --/assets
        --/my-cool-post
          --/my-cool-image.png
          --/my-other-cool-image.png
    ```

    And still easily link your images like this:

    {% raw %}
    ```markdown
    <img src="{% file_link my-cool-image.png %}">
    ![]({% file_link my-other-cool-image.png %})
    ```
    {% endraw %}

    Then I reccommend `jekyll-file-link`. check the install instructions in the repo.

    `jekyll-file-link`'s repo: [https://github.com/Helaxious/jekyll-file-link](https://github.com/Helaxious/jekyll-file-link)

But if your blog doesn't use that many assets, and you rarely need to link a file, you probably don't need to use these plugins.

### Tip: Working with drafts

You may want to write a blog post in the `_posts` folder, but it's incomplete and you don't want to show up in your blog right away, not even being able to be accessed by URL, for that, you can use drafts, simply, create in your project's folder a new folder called `_drafts` (make sure to type exactly like that, so Jekyll recognizes the folder).

Move your work inside there, and it won't show up in your blog anywhere. To let Jekyll show your drafts though, you'll need to stop the server, and re-run it with a slightly different command:

```bash
jekyll serve --drafts
```

The `_drafts` folder works a bit different than the `_posts` folder though, you don't need to put a date in your title, just a normal title fits.

In addition, [thanks for a youtube comment in this video for pointing that out,](https://www.youtube.com/watch?v=X8jXkW3k2Jg) if you just want to hide a post, while being in the `_posts` folder, you can put in the front matter.

```yaml
published: false
```

And it will hide it from your blog.

## Customizing our blog, and applying a theme and a plugin

Now that we covered just enough to get you started blogging with Jekyll, let's customize it and give it a finished look.

### Getting rid of the placeholders

I said earlier that I would get rid of the placeholder text, like the title, the description and social media, Let's do it now, I'm going to grab `_config.yml`, go line by line, and do the following edits: (If you don't want to fill some parameters like email or social media, just delete the entry and Jekyll will not show it, even the title, though I would advise to fill at least the title and description).

(Another note: When you make some kind of changes, like changing `_config.yml`, you need to restart the server to see the effects (press Control-C to stop `jekyll`, and type `jekyll serve` to start the server again)).

I want my blog's name to be `snake_cases` And I want to add my gmail email in there:

``` yaml
title: snake_cases
email: helaxious@gmail.com
```

Now let's add a short description of my blog:

```yaml
description: >-
  snake_cases is a programming blog that shares my adventures and findings
  about programming in general, you'll find cool stuff like games, websites,
  art, and everything in-between!
```

We don't need to touch on these now, but depending on how we host our blog in Github Pages, we might have to modify `baseurl`.

``` yaml
baseurl: "" # the subpath of your site, e.g. /blog
url: "" # the base hostname & protocol for your site, e.g. http://example.com
```

Now onto social media:

```yaml
twitter_username: jekyllrb
github_username:  jekyll
```

Before I modify it, here's a tip for you, if you want to include some other social media link, there's actually a list of every social media link that `minima` (Jekyll's default theme) supports in its README file, here's the list (may not work in some themes):

```yaml
twitter_username: jekyllrb
github_username:  jekyll
dribbble_username: jekyll
facebook_username: jekyll
flickr_username: jekyll
instagram_username: jekyll
linkedin_username: jekyll
pinterest_username: jekyll
youtube_username: jekyll
googleplus_username: +jekyll
rss: rss

mastodon:
 - username: jekyll
   instance: example.com
 - username: jekyll2
   instance: example.com
```

Since I use Github, I will add my account here. And delete the `twitter_username` variable

```yaml
github_username:  helaxious
```

Finally, we can put our plugins and our theme, although I'm not going to use a plugin, I'm going to show how to install a theme and a plugin in a later section.

```yaml
theme: minima
plugins:
  - jekyll-feed
```

### Editing our blog pages

Now that I edited `_config.yml` as the way I want, we can see that our website changed quite a bit, it kinda looks the same, but removing the placeholder text made it look much more finished and professional:

![Our homepage, but with all the placeholders changed]({% file_link jekyll-modified-homepage.png %})

(Note: Removed the default post since we don't need it anymore).

It seems that we squashed every placeholder in our blog, but there's actually one more place (and maybe another one if you're in the mood) to customize: The about page.

Let's check the `about.markdown` file to see what's inside:

```markdown
---
layout: page
title: About
permalink: /about/
---

This is the base Jekyll theme. You can find out more info about customizing your Jekyll theme, as well as basic Jekyll usage documentation at [jekyllrb.com](https://jekyllrb.com/).

You can find the source code for Minima at GitHub:
[jekyll][jekyll-organization] /
[minima](https://github.com/jekyll/minima)

You can find the source code for Jekyll at GitHub:
[jekyll][jekyll-organization] /
[jekyll](https://github.com/jekyll/jekyll)


[jekyll-organization]: https://github.com/jekyll
```

First, you may have noticed some differences in the front matter compared to our blog posts, the `layout` is set to page, there's no `date`, there's still a `title`, but there's also a parameter we've never seen before, `permalink`, like the name suggests, is a way to set a specific URL for your page, you can also do that for posts if you want. If you don't put an `permalink`, Jekyll will automatically set an URL for you.

So if you want to set a different title, or put a different URL, just change the front matter. I'm going to replace everything (except the front matter) and include my own text:

```markdown
---
layout: page
title: About
permalink: /about/
---

## About snake_cases

Hey there, `snake_cases` is a personal programming blog where I share anything about programming that interests me, in other words, mostly about Python and videogames.
```

Now that we customized our about page, there's one more page left, the `404.html`, if you don't know HTML, or you just want to leave like that, that's ok too.

I'm going to just edit these paragraphs, to not make it look kinda generic:

```html
<div class="container">
  <h1>404</h1>
  <p><strong>Page not found :(</strong></p>
  <p>The requested page could not be found.</p>
</div>
```

```html
<div class="container">
    <h1>404</h1>
    <p><strong>Page not found :(</strong></p>
    <p>Sorry, the requested page could not be found. Perharps you mispelled the url?</p>
    <p>If you think that should not happen, let me know (send me an email).</p>
</div>
```

### Applying a theme and installing a plugin (optional)

Now, I'm going to show how to install a theme, and how to install a plugin, since plugins are easier to install, let's do that first.

### Installing a plugin

Contrary to themes, you don't have multiple installation methods on plugins, and the plugin installation method is pretty easy, let's pick a simple plugin as an example, `liquid_reading_time` does what it says on the tin, I can use a `liquid` function to add the reading time of an article, superfluous? I wouldn't say so.

??Let's add this gem to the `Gemfile`:

```ruby
gem "liquid_reading_time"
```

...and let's tell `_config.yml` to use it, make sure it's in the `plugins` group:

```yaml
plugins:
  - jekyll-feed
  - liquid_reading_time <------ here
```

Run `bundle` in our project, and it's done!

#### Before you install a theme

Now that we customized and branded a bit our website, we're going to apply a theme to it. But do also note that you're not limited to only themes, you may also make your website from scratch if you wish, or maybe modify an existing one.

But before we go search for a theme, let's discuss the three possible ways we can install a theme:

1. Gem-based themes (Recommended):

    This is the option I recommend you to use, Gem-based themes are very easy to use and manage, and the installation is very simple:

    Just like we did with the plugin, add the theme in the `Gemfile`:

    ```ruby
    gem "your_theme_here"
    ```

    Then let's substitute the `theme` variable in the `_config.yml`:

    ```yaml
    theme: "your_theme_here"
    ```

    The only downside to Gem-based themes is that not every theme is Gem-based, generally, some themes are hosted on Github *only*, for that, you'll need to use `jekyll-remote-theme`, which is another great alternative.

2. `jekyll-remote-theme`:

    `jekyll-remote-theme` is a plugin that allows us to use basically *any* theme that is hosted on Github, you can use it locally and on Github Pages too, the only downside is that if you're editing your Jekyll website locally, you need to *always* be online to make it work, the way you use it is as follows:

    Before we use the plugin, we must first *install* the plugin, we can do the same gist we saw on the 'Installing a plugin', just replace the plugin's name with `jekyll-remote-theme`.

    Now let's tell `jekyll-remote-theme` to use a remote_theme, go to `_config.yml`, comment the current theme (put a hashtag at the start of the line):

    ```yaml
    # theme: some_theme
    ```

    And right below it, let's put our `remote_theme` (make sure to use an underscore `_` and not a dash `-`), also make sure the theme's name is formatted like this:

    ```yaml
    remote_theme: owner/repository
    ```

    To know the `owner` and the `repository` name, we just need to look at the repository's URL:

    ```
    https://github.com/jekyll/minima
                        ^        ^
                      owner    repository
    ```

    Now let's add it, it should look something like this:

    ```yaml
    # theme: some_theme
    remote_theme: jekyll/minima
    ```

    And that's it! To switch themes, all we need to do is to replace the remote_theme variable!

3. Just cloning/copy-pasting the theme:

    This is a good option if you want to tinker with a theme, maybe you want to modify it with your own improvements, or just see how it works. Although that's probably not what you want.

#### Installing a theme

Let's now hunt for a theme, in my opinion the best place to find themes is [searching `jekyll-theme` in ruby-gems.org](https://rubygems.org/search?query=jekyll-theme), you can try it yourself, scrolling until some theme grabs your attention.

[This theme in particular](https://rubygems.org/gems/jekyll-theme-hydeout) grabbed my attention, it seems to fit well to the detective vibe that I want my blog to have, if we [click on the gem's homepage](https://github.com/fongandrew/hydeout), we are taken to its Github repository, here we can read the README.

Since hydeout is a Gem-Based theme, we can install it using the method I showed you earlier, just replace the theme's name with `jekyll-theme-hydeout`.

Let's hop into our blog, and see if anything changed:

![Blank page]({% file_link new-theme-empty-blog.png %})

...As you can see, there's no content here, we need to do some adjustments. Obviously, if you're using a different theme, something different will happen. But showing the trouble-shooting process is still helpful.

#### Doing some adjustments

Well, it's an empty page, generally, when we use a new theme, there's usually some tiny adjustments we need to do, for that, we should check the theme's README, in my case, if we check hydeout's README, we can see the following:

> Hydeout uses pagination, so if you have an `index.md`, you'll need to swap it with an `index.html` that uses the `index` layout:
> ```
> ---
> layout: index
> title: Home
> ---
> ```
> You'll also need to add a setting to `_config.yml` telling Jekyll how many posts to include per page (e.g. `paginate: 5`).

Doing a quick check in my project's file structure, our index page is indeed a `markdown` file, let's delete it, and make a new file named `index.html` and fill it with this:

```yaml
---
layout: index
title: Home
---
```

Now let's go to `_config.yml` and add the `paginate` variable, let's put it below the `theme` variable:

```yaml
# Build settings
theme: jekyll-theme-hydeout
paginate: 5
plugins:
  - jekyll-feed
```

Running our website now should show us our great theme!

![Our blog with an applied theme]({% file_link new-theme-fixed-theme.png %})

Well, there's some other changes I should make, but I think I showed you all the essentials, you're now capable of creating a website in Jekyll, how to write a blog post in it, how to apply a theme and a plugin, all that it lefts now is *publishing*.

## Hosting the blog with Github Pages

We finally finished building our blog! It still has a lot of work we could do, I could fully customize every element of my website. But at this stage, it's fully functional, and ready to host.

We're going to also need the help of a tool called [jekyll-deploy-action](https://github.com/jeffreytse/jekyll-deploy-action) that will build and deploy our blog for us, the reason we're going to use it is because Github actually [only allows a set of plugins](https://pages.github.com/versions/) on Github Pages, `jekyll-deploy-action` helps us by overcoming that restriction. Don't worry about the details, it's super easy to set up.

Let's now do the last step to finish our case, host our blog in Github Pages!

### Creating an empty Github Repository

Let's create a Github repository, one fast way to do it, is to just go to [github.com/new](https://github.com/new), and it will prompt us to create a repository right away!

![Page showing the creation of a Github repository]({% file_link new-github-repository.png %})

Let's now give it a name, we have two options here, either we give it a regular name, like 'blog', or we name it `your-username.github.io`, where we replace `your-username` with your github username, make sure that you type it correctly.

The difference in those two options is in your blog's URL, if you name your repository like `your-username.github.io`, your blog URL will look like this:

```
https://your-username.github.io
```

If you give a regular name, like, for example, blog, it will look like this:

```
https://your-username.github.io/blog
```

If you want to do it that way, you will also need to set the `baseurl` variable inside `_config.yml` to the name of your repository in front of a slash, for example, if you give the name `cool-blog`, you need to put `baseurl: "/cool-blog"`.

Keep in mind that modifying the `baseurl` may break a bit your website, so you'll need to have a different `_config.yml` in your Github repository, and another `_config.yml` in your local repository, I'm going to show how to do that later, so don't worry about it.

But anyways, in my opinion, I prefer just giving it a regular name instead of my username, as it makes it clear that this website is a blog, but feel free to choose whatever you want.

Now let's take a look at our repository again:

![Repository creation page, with the name and description filled]({% file_link repository-name-description.png %})

I also filled the description, you can fill it with whatever you want, or keep it empty if you like. You can check to make your repository private if you want, just make sure to switch back to public when you want to publish it.

Now let's scroll a bit, check `Add a README file` (it's a bit easier to work on a repository that isn't empty), and click `Create Repository`.

![End of the repository creation page]({% file_link repository-extra-stuff.png %})

That will takes us to our repository, isn't it beautiful? Let's remove the README file too, as we don't need that anymore.

![Page of our new repository]({% file_link github-new-repository.png %})

Now that we created a repository, we're ready to set up `jekyll-deploy-action`.

### Setting up `jekyll-deploy-action`

Now, let's set up `jekyll-deploy-action`, let's first go to our project (remember to be in the root folder), and create a folder named `.github`, and inside `.github` make another folder called `workflows`, make sure to spell them *exactly* like that, now, inside the `workflows` folder, let's create a text file, something like `build-jekyll.yml`, make sure to end it with `.yml`.

Now let's copy and paste some text, let's go to [jekyll-deploy-action's repository](https://github.com/jeffreytse/jekyll-deploy-action#-usage) and go to the `usage` section, there's a template file we can copy, click on the `copy` button, paste the contents inside your file, that's our configuration file!

![Cursor hovering a copy button]({% file_link deploy-script-copy-paste.png %})
(Hover the text, and a button should show up).

Awesome! Let's paste that in our file, now let's edit the file:

```yaml
on:
  push:
    branches:
      - master  # Here source code branch is `master`, it could be other branch
```

Since we created our repository in Github, the default branch is named `main`, not `master`, let's change that:

```yaml
on:
  push:
    branches:
      - main
```

Here we see Jekyll's baseurl, we simply just need to type whatever is the `baseurl` in `_config.yml`

```yaml
jekyll_baseurl: ''         # Default is according to _config.yml
```

In my case, the baseurl is `/snake_cases`, let's put that then:

```yaml
jekyll_baseurl: '/snake_cases'
```

And that's all we had to do to set it up!

### Creating `gh-pages` branch

Now let's create a branch named `gh-pages` which by default, is the name of the branch that Github publishes from, this is where our published site will go, but the normal jekyll files should be in the `main` branch:

Let's go to our repository, click on the `main` button, type `gh-pages`, and click `Create branch: gh-pages from 'main'`.

![Dialog box of our branches]({% file_link repository-create-branch.png %})

Now we're on the `gh-pages` branch, let's go back to the `main` branch!

![Cursor hovering 'main' in the branches dialog box]({% file_link repository-changing-branch.png %})

### Uploading our project

First, we are going to clone our Github repository, we need to grab a link for this, let's go back to our repository, there's a big green button called `Code`, click on that, click on `HTTPS` or `SSH`, and click on the copy button, and that's it, that's our link!

![Dialog box of cloning our repository]({% file_link repository-remote-link.png %})

Now let's get back to our terminal, outside our project folder, type `git clone your_url`, replacing `your_url` with the copied link, it's going to make a folder with our Github repository inside of it, it should show something like this, this means our cloning was a success:

```
Cloning into 'snake_cases'...
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (5/5), done.
```

Now we're going to copy our project's contents over to our new folder, then we're going back to the terminal, go inside our project using `cd`, and tell `git` to add our projects contents, for that, we can use `git add .`, then tell git to apply those changes with `git commit -m "your_message_here"`, then we tell git to upload our changes to our Github repository using `git push`.

(If you don't have git setup to use with github, you'll get an error when trying to `git push`. Follow [Github's tutorial on this](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to set git for Github).

That's our series of commands we want to do whenever we update our blog, so make sure to memorize them:
- `git add .`
- `git commit -m "message"`
- `git push`

And just like that, we uploaded our project into our Github repository! Now, because we added `jekyll-deploy-action`, it detected new changes in the `main` branch (the one we uploaded to), built our website, and put in the `gh-pages `branch, that means that, if everything was done correctly, our website is online!

### Going to our website

Let's then go to our awesome website! Our website link is as follows, first our Github username, followed by `.github.io`, and if we named our repository anything other than `github_username.github.io`, where `github_username` is the username, and if we gave an regular name to our repository, follow it with a slash and the repository name:

```
github_username.github.io/repository-name
```

In my case, my link would be `helaxious.github.io/snake_cases`. Let's go to our website!

![Our website hosted on Github Pages]({% file_link hosted-website-good-page.png %})

Incredible!

### Configuring `_config.yml`

(If you have named your repository `your_github_username.github.io` you can skip this section, this section only applies if you picked a different name).

It seems like everything is cool now, but if we try to go back to our local server, our website looks ugly now! What happened?

Well, because the `baseurl` is set to our repository name, our blog can't access a bunch of files! What we are going to do?

Well, we can modify the `_config.yml` in our *local* repository, but when we push those changes to our *Github* repository, it's going to modify the `_config.yml` there too!

So we need a way to keep our local repository's `_config.yml` different from the `_config.yml` from our Github repository, is there a solution?

There is! We can tell git to ignore any changes to our `_config.yml` let's pull a terminal and type the following:

```
git update-index --assume-unchanged "_config.yml"
```

This may be not a perfect solution, but at least it helps the problem a bit.

Now let's open `_config.yml` and let's leave the `baseurl` variable blank:

```yaml
baseurl: ""
```

If we restart our server, when we open our blog, it should display as normal!

But do note, that if you want to update your `_config.yml` in the Github repository you'll have to do that manually (if you view the `config.yml` file on Github on a browser, there should be an option to edit the file).

### Publishing our changes to our website

Now, when you're happy with a post, or maybe you want to change something in your website, and you want to update the blog. Then you will need to do just like I showed you in the [Uploading our project](#uploading-our-project) section, the series of commands we need to type to update the server is really simple, open a terminal, and type these commands in succession:

- `git add .`
- `git commit -m "your_message_here"`
- `git push`

And that's it, that's all you need to update your website!

## Conclusion

<p style="text-align: center">
CONGRATULATIONS!<br>
We made a cool blog together!<br>
Enjoy your new blog.<br>
</p>

And just like that, we covered basically EVERYTHING you need to create a Jekyll blog, manage it, and publish it, in this comprehensive guide, we learned together:

- What Jekyll is, its features, and what is a static site.
- How to create a Jekyll blog, and run it.
- How to create a post, and what is the `Front Matter`.
- How to work with images, how to organize our posts in folders, and work with drafts.
- We learned to customize our blog at a basic level.
- How to install themes and plugins.
- How to host our blog in Github Pages.
- How to publish our changes.

Now, you're well equipped to create your blog, pretty cool huh?

## Sources

Giraffe Academy's series on Jekyll, invaluable help for me to write this post, and to make this very site: <a href="https://www.youtube.com/playlist?list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB">https://www.youtube.com/playlist?list=PLLAZ4kZ9dFpOPV5C5Ay0pHaa0RJFhcmcB</a>

Cloudfare's website's definition of a Static Site Generator: <a href="https://www.cloudflare.com/learning/performance/static-site-generator/">https://www.cloudflare.com/learning/performance/static-site-generator/</a>

Gitlab's blog post about the differences of a dynamic and a static website: <a href="https://about.gitlab.com/blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/">https://about.gitlab.com/blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/</a>
