---
layout: default
---

**portableR** is a version of R statistics that have all their static libraries within the same folder, this lets run in x86_64 computers. It's useful when you don't have access as root to install packages. This project is aimed to run in web servers to build microservices ([**AWS Lambda**][labmda]) that require R to process data, png chart generation, etc.

##News

<ul>
  {% for post in site.posts %}
    <li>
      {{ post.date | date: "%b %-d, %Y" }} <a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
    </li>
  {% endfor %}
  <li>Sep 11, 2015 <a href="http://nafiux.com/blog/2015/09/11/running-r-statistics-in-aws-lambda/">Running R Statistics in AWS Lambda (original)</a></li>
</ul>

##Features

- Project size ~40 MB to meet the AWS Lambda requirements that allows sizes up 50MB

## Packages

- [ggplot2]
- [jsonlite]

##Usage

Unzip the project in your work directory, for exmaple in the user homedir (see run.sh file).

Setup environment variables:

{% highlight sh %}
export LD_LIBRARY_PATH=`pwd`/lib
export R_HOME=`pwd`
export R_LIBS=`pwd`/site-library
{% endhighlight %}

####Check version

{% highlight sh %}
./R --version
{% endhighlight %}

Output

{% highlight sh %}
R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
{% endhighlight %}

####Run R script with params

You need to pass the absolute path of the script.

{% highlight sh %}
./R --no-restore --file=`pwd`/examples/age.R --args 1988
{% endhighlight %}

Output

{% highlight sh %}
> (today <- Sys.Date())
[1] "2015-09-19"
> (year <- format(today, "%Y"))
[1] "2015"
> (birthYear <- commandArgs(trailingOnly=TRUE)[1])
[1] "1988"
> as.numeric(year) - as.numeric(birthYear)
[1] 27
>
{% endhighlight %}

##Examples

- [Running R Statistics in AWS Lambda (original)][original]

##Future work

- Currently it does not include **curl** package (http requests not supported).

##Collaboration

Please report [issues] in GitHub.

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

[jsonlite]: https://cran.r-project.org/web/packages/jsonlite/index.html
[ggplot2]:  http://ggplot2.org/
[original]: http://nafiux.com/blog/2015/09/11/running-r-statistics-in-aws-lambda/
[issues]:   https://github.com/nafiux/portableR/issues
[labmda]:	https://aws.amazon.com/lambda/
