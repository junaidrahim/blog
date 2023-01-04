#!/bin/bash

touch _posts/$(date +%Y-%m-%d)-$1.md
echo "---" >> _posts/$(date +%Y-%m-%d)-$1.md
echo "title: $1" >> _posts/$(date +%Y-%m-%d)-$1.md
echo "layout: post" >> _posts/$(date +%Y-%m-%d)-$1.md
echo "draft: true" >> _posts/$(date +%Y-%m-%d)-$1.md
echo "---" >> _posts/$(date +%Y-%m-%d)-$1.md