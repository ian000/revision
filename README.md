# 静态资源版本号自动编译 

> Static asset revisioning by appending content hash to filenames
`unicorn.css (.js or .jpg or images format)` → `unicorn-098f6bcd.css ` and relace the reference which in the html code


## Example

### src

```html+jinja

<!DOCTYPE html>
<html>
<head>
    <title>  My App</title>
    <link rel="stylesheet" href="./app/css/main.css">
  </head>
  <body>
    <script src="./app/js/main.js"></script>
  </body>
</html>

'''

### to dist

```html+jinja
<!DOCTYPE html>
<html>
  <head>
    <title>  My App</title>
    <link rel="stylesheet" href="./app/css/main-da36c084.css">
  </head>
  <body>
    <script src="./app/js/main-457c307b.js"></script>
  </body>
</html>
'''


## Install

```
$ npm i
```

## Run:

```
    jade compile：

        $ gulp 
        
        or  
        
        $ gulp revJade

    html compile：

        $ gulp revHTML

```

### Surport:

```
        - jade
        - html
        - js
        - css
        - images
```
### PHP reads the manifest and provides asset names

```php
        /**
        * @param  string  $filename
        * @return string
        */

        function asset_path($filename) {
            $manifest_path = 'assets/rev-manifest.json';

            if (file_exists($manifest_path)) {
                $manifest = json_decode(file_get_contents($manifest_path), TRUE);
            } else {
                $manifest = [];
            }

            if (array_key_exists($filename, $manifest)) {
                return $manifest[$filename];
            }

            return $filename;
        }



    

