# 静态资源版本号自动编译 



1. install:  
	 	npm i 
- run:    
		1. jade模板编译：gulp 或	gulp revJade
		- html编译：gulp revHTML
- Surport:
	1. jade
	- html
	- js
	- css
	- images
- PHP reads the manifest and provides asset names

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



	

