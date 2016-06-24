<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
		<title>GitHub Markdown CSS demo</title>
		<link rel="stylesheet" href="github-markdown.css">
		<link rel="stylesheet" href="GitHub.css">
		<style>
			body {
				box-sizing: border-box;
				min-width: 200px;
				max-width: 980px;
				margin: 0 auto;
				padding: 45px;
			}
		</style>
	</head>
	<body>
	
       <article class="markdown-body">
	    <?php 
		include 'Parsedown.php';
		$Parsedown = new Parsedown();
        $content = file_get_contents('README.md'); 
		echo $Parsedown->text( $content);
        ?>
	   </article>
       
	</body>
</html>
