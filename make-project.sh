#!/bin/bash
# create spring boot project

# this gets data for variables
function getNames() {
	echo "******************************************"
	echo "This script will build a base Spring Boot"
	echo "application for you, just enter a name for"
	echo "the project and a directory to save it in."
	echo "EXAMPLE: /home/user/workspace <- no trail /"
	echo "******************************************"
	read -p "Enter name of project " PROJECTNAME
	read -p "Enter the full path you wish to save in  " DIRNAME
	echo "******************************************"
}
# this makes all the directories
function makeProject() {
	if ! [ -e /home/$USER/$PROJECTNAME ]
	then
		mkdir $DIRNAME/$PROJECTNAME
		mkdir $DIRNAME/$PROJECTNAME/src
		mkdir $DIRNAME/$PROJECTNAME/src/main
		mkdir $DIRNAME/$PROJECTNAME/src/main/java
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/controller
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/model
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/config
		mkdir $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/repository
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources/static
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources/static/css
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources/static/js
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources/static/images
		mkdir $DIRNAME/$PROJECTNAME/src/main/resources/templates
		echo "Directory generation complete"
	else
		echo "Directory already exsists"
	fi
}

#this makes some basic classes, index.html and gradle.build
function makeBaseFiles() {

# creates a main class
cat << EOF > $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/MainApplication.java
	
package com.$PROJECTNAME;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MainApplication {

	public static void main(String[] args) {
		SpringApplication.run(MainApplication.class, args);
	}
}

EOF

# creates a controller
cat << EOF > $DIRNAME/$PROJECTNAME/src/main/java/com/$PROJECTNAME/controller/IndexController.java

package com.$PROJECTNAME.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
		
	}
}

EOF

# creates index.html
cat << EOF > $DIRNAME/$PROJECTNAME/src/main/resources/templates/index.html

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org/">
<head>
	<meta charset="UTF-8"/>
	<title></title>
</head>
    <body>
	<h1></h1>

    </body>
</html>
EOF

# creates gradle file
cat << EOF > $DIRNAME/$PROJECTNAME/build.gradle

buildscript {
	repositories {
		mavenCentral()
	}
	dependencies {
		classpath("org.springframework.boot:spring-boot-gradle-plugin:1.5.1.RELEASE")
	}
}

apply plugin: 'java'
apply plugin: 'idea'
apply plugin: 'org.springframework.boot'	

jar {
	baseName = 'test01'
	version = '1.0'
}
repositories {
	mavenCentral()
}


dependencies {
	compile('org.springframework.boot:spring-boot-starter-thymeleaf')
	compile('org.springframework.boot:spring-boot-starter-web')
	runtime('org.springframework.boot:spring-boot-devtools')
	testCompile('org.springframework.boot:spring-boot-starter-test')
}

EOF

#creates application.properties
cat << EOF > $DIRNAME/$PROJECTNAME/src/main/resources/application.properties

# enter application properties here such as
# server.port=5000	
EOF
	echo "Base file generation complete"
}

# main section
getNames
makeProject
makeBaseFiles
exit 0
