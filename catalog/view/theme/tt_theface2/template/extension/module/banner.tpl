<div class="banner-ourbrands owl-style2">
<div class="container">
	<div class="module-title">
		<h2><?php echo $heading_title; ?></h2>
	</div>
	<div id="banner<?php echo $module; ?>">
		<?php foreach ($banners as $banner) { ?>
			<div class="item text-center">
				<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
				<?php } else { ?>
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
				<?php } ?>
			</div>
		<?php } ?>
	</div>
</div>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 5,
	autoPlay: false,
	navigation: true,
	pagination: false,
	transitionStyle: 'fade',
	itemsDesktop : [1199,5],
	itemsDesktopSmall : [991,4],
	itemsTablet: [768,3],
	itemsMobile : [480,2],
	slideSpeed : 1000,
	addClassActive: true,
	navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],	
});
	
--></script>
