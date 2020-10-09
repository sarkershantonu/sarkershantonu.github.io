---
layout: post
title: Introduction to Junit Benchmark
date: "2013-01-08 02:54"
tags: [junit, performance-testing]
permalink: /2013/01/08/test-integration-platform/
gh-repo: sarkershantonu/sarkershantonu.github.io
excerpt: "Blog on test integration with co/cd"
gh-badge: [star, follow]
comments: true
---

## Technologies
- Java
- Jenkins CI/CD
- Jmeter
- Allure
-Chrome

## Java Libraries
- Selenium
- Junit5
- Allure
- Apachi POI
- Apache Common
- Ashot
- selenide
- jsoup
- RestAssured
- JunitBenchmark
- Cucumber
- TestLink Client
- Redmine Client
- Oracle JDBC
- SLF4J
- DBUnit

## Maven Project structure
- Cucumber-selenium BDD acceptance tests(GUI)
- selenide-selenium-junit GUI test 
- Oracle JDBC data test
- API tests with RestAssured(if any)
- Jmeter Performance Test (if any)

## Execution Plan
- Running Test using maven-failesafe (verify stage)
- Allure Reporting using maven
- Code-review using Sonarqube-maven
- jenkins test execution adhoc
- jenkins code commit -> code review at sonarqube trigger.
- jenkins code commit -> unit test trigger. 
- Dev Local UAT executions before code commit
- Testers can execute tests locally

## Reporting 
- Allure Reporting 
- Cucumber HTML reporting
- log4j HTML/file/CLI

## Optional addons
- Selenium RC can be integrated for company wide selenium GRID setup
- Jmeter Performance Tests

## Requirements 
- VMs with enough configurations(Jenkins, Selenium GRID server, Selenium Grid Slave,Jmeter)
- Enough Bandwidth
- necessary access to environments