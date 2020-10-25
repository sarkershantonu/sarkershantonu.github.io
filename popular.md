---
layout: page
title: "Popular Posts"
subtitle: I build systems for testing
css: "/css/index.css"
meta-title: "Full Stack Performance Engineer/SDET/Java Developer"
meta-description: "Test developer with a Bsc in Computer Science"
comments: true
---
<div class="list-filters">
    <a href="/" class="list-filter filter-selected">All posts</a>
    <a href="/courses" class="list-filter">courses</a>
	<a href="/talks" class="list-filter">talks</a>
    <a href="/tags" class="list-filter">Index</a>
</div>

<div class="posts-list">
  {% for post in site.tags.popular %}
  
    <article>
    <a class="post-preview" href="{{ post.url | prepend: site.baseurl }}">
    
	    <h2 class="post-title">{{ post.title }}</h2>
	
	    {% if post.subtitle %}
	        <h3 class="post-subtitle">
	            {{ post.subtitle }}
	        </h3>
	    {% endif %}
        <p class="post-meta">
        Posted on {{ post.date | date: "%B %-d, %Y" }}
        </p>

      <div class="post-entry">
        {{ post.content | truncatewords: 50 | strip_html | xml_escape}}
        <span href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">[Read&nbsp;More]</span>
      </div>
    </a>    
    </article>
   
  {% endfor %}
  
</div>
