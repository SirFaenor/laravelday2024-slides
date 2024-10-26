#!/bin/sh
echo "Setup..."

npm install @slidev/cli @slidev/theme-default @slidev/theme-vercel

if [ -f /app/slidev/slides.md ]; then
    echo "Start slidev..."
    
else
    echo "slides.md not found in the bind mount to /slidev"
    cp -f /app/node_modules/@slidev/cli/template.md /app/slidev/slides.md
    sed -i ':a;N;$!ba;s/GitHub"\n/GitHub"/g' /app/slidev/slides.md

fi

npm run dev