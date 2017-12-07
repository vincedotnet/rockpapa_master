<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/tt_theface4/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css" rel="stylesheet">
<script src="catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700i,700,800" rel="stylesheet"> 
<script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.plugin.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_theface4/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_theface4/stylesheet/opentheme/css/animate.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_theface4/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet" />
<script src="catalog/view/javascript/jquery/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_theface4/stylesheet/opentheme/ocquickview/css/ocquickview.css" rel="stylesheet">
<link href="catalog/view/theme/tt_theface4/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?> home4 group1">
<header>
	<div class="top-header">
		<div class="block-left pull-left">
			<ul>
				<li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i><?php echo $telephone; ?></a></li>
				<li><a href="<?php echo $contact; ?>"><i class="fa fa-envelope-open-o"></i><?php echo $email; ?></a></li>
				<li><?php if(isset($block1)){ echo $block1; } ?></li>
			</ul>
		</div>
		<div class="block-right pull-right">
			<nav id="top">
				<ul class="list-unstyled top-links">							
					<li>
						<div class="btn-group">
						<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
							<span class="text-ex"><i class="fa fa-user-circle-o"></i><?php echo $text_account; ?><i class="fa fa-angle-down"></i></span>
						</button>
						<div id="top-links" class="dropdown-menu">
							<?php if($use_ajax_login): ?>
								<ul class="ul-account list-unstyled">
							<?php else: ?>
								<ul class="list-unstyled">
							<?php endif; ?>
							<?php if ($logged) { ?>
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
							<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>							
							<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
							<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a></li>
							<li>
								<?php if($use_ajax_login): ?>
									<a id="a-logout-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
								<?php else: ?>
									<a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
								<?php endif; ?>
							</li>			
							<?php } else { ?>
							<li>
								<?php if($use_ajax_login): ?> 
									<a id="a-register-link" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
								<?php else: ?>
									<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> 
								<?php endif; ?>
							</li>
							<li>
								<?php if($use_ajax_login): ?> 
									<a id="a-login-link" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
								<?php else: ?>
									<a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> 
								<?php endif; ?>
							</li>
							<?php } ?>
						  </ul>
						</div>
						</div>
					</li>
					<li><?php echo $currency; ?></li>
					<li><?php echo $language; ?></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container-fix">
		<div class="logo-container pull-left">
			<div id="logo">
			  <?php if ($logo) { ?>
			  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			  <?php } else { ?>
			  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			  <?php } ?>
			</div>
		</div>
		<div class="block-right pull-right">
			<div class="cart-container pull-right"><?php echo $cart; ?></div>
			<div class="search-containers pull-right"><?php echo $search; ?></div>	
		</div>
		<!-- <div class="container"> -->
			<div class="main-menu">
				<?php if(isset($block2)){ echo $block2; } ?>
			</div>
		<!-- </div> -->
	</div>
</header>
<div class="clearfix"></div>