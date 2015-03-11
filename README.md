# 静态资源版本号自动编译 

> Static asset revisioning by appending content hash to filenames
`unicorn.css (.js or .jpg or images format)` → `unicorn-098f6bcd.css ` and relace the reference which in the html code

## Install

```
$ npm i
```

## Run:

```
	jade模板编译：

		gulp 或	gulp revJade

	html编译：
		gulp revHTML
```

### Surport:
		- jade
		- html
		- js
		- css
		- images
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



	

