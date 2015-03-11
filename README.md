# 静态资源版本号自动编译
-------

 	
2. ### install:  
	npm i 
2. ### run:    
	1. jade模板编译：gulp 或	gulp revJade
	2. html编译：gulp revHTML
	
3. ### Surport:
	1. jade
	2. html
	3. js
	4. css
	5. images
4. ### PHP reads the manifest and provides asset names

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


	

