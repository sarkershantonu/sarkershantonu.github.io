---
layout: post
title: How to use youtube-dl in ubuntu cli?
date: "2018-01-28 05:02"
tags: [tools]
permalink: /2018/01/28/youtube-dl-basics/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how we can use youtube-dl.

### What is youtube-dl? 
youtube-dl is a CLI utilities for downloading videos from youtube. 

### Why youtube-dl?
- If you want to download big videos without watching
- If you have a playlist and you want to download over night or without your control
- If you want to download entire channel 
- If you have a schedule job which downloads youtube videos. 

### Installation 
- Install via APT

		sudo apt-get install -y youtube-dl
- install via PIP

		sudo pip install youtube-dl
	
- install manually (best way to get latest version)

		sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
		sudo chmod a+x /usr/local/bin/youtube-dl
		hash -r

# Updating
- To update 

	sudo youtube-dl -U
			
# Usages 
- How to download an individual video ?  

       youtube-dl your_video_url
       
- How to download a whole channel with a username 

       youtube-dl -citw ytuser:youtube_user_name
- How to download a whole playlist

       youtube-dl -citw your_video_playlist_url
- How to download a links containing link.txt file. Each link present in single line. 

		youtube-dl -q --no-warnings -f best -a link.txt	
		
### More Options 
There are more CLI options, here is the whole list. 		

