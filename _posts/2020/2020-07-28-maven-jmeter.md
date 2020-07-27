---
layout: post
title: Jmeter with maven
date: "2020-07-28 05:02"
tags: [jmeter,ci-cd]
permalink: /2020/07/28/maven-jmeter/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on Jmeter"
gh-badge: [star,follow]
comments: true
---
In this article we are going to see how can we perform Jmeter testing using maven, so that we can use this in CI/CD. 

## What is Jmeter? 
Jmeter is a performance testing tool which can be integrated with CI/CD.

## What is Maven 
Maven is Java Build automation tool. 

## Why Maven with Jmeter? 
Usually we test with any Java code. Ideally an acceptance test should have some form of performance testing with it. We are going to use maven jmeter plugins to test a web application like a development project build. 

This will allow us to "Shift Left" performance testing. And this will allow any CI/CD system (like jenkins) , execute the test and show reports.

 

