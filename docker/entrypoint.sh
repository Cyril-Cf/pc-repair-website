pug html_templates/pug/*.pug -o . --pretty
html-minifier --input-dir . --output-dir . --file-ext html --collapse-whitespace --minify-css true --minify-js true
for f in js/*.js; do
    if [[ "$f" != *".min.js" ]]; then
        filename=$(basename "$f" .js)
        echo "Processing file: $f"
        if [ ! -f "dist/js/$filename.min.js" ]; then
            if [ ! -d "dist/js" ]; then
                mkdir -p dist/js
            fi
            touch dist/js/$filename.min.js
        fi
        uglifyjs "$f" -o "dist/js/$filename.min.js"
    fi
done
for f in css/*.sass; do
    filename=$(basename "$f" .sass)
    if [[ ! "$filename" =~ ^_ ]]; then
        echo "Processing file: $f"
        node-sass "$f" "dist/css/$filename.min.css" --output-style compressed
    fi
done
