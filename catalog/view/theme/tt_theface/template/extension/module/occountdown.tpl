<script type="text/javascript">
	if (typeof OC == 'undefined') OC = { };
	OC.Countdown = {
		TEXT_YEARS 		: '<?php echo $text_years ?>',
		TEXT_MONTHS 	: '<?php echo $text_months ?>',
		TEXT_WEEKS 		: '<?php echo $text_weeks ?>',
		TEXT_DAYS 		: '<?php echo $text_days ?>',
		TEXT_HOURS 		: '<?php echo $text_hours ?>',
		TEXT_MINUTES 	: '<?php echo $text_minutes ?>',
		TEXT_SECONDS 	: '<?php echo $text_seconds ?>'
	};
</script>
<script type="text/javascript" src="catalog/view/javascript/jquery.countdown.js"></script>
<?php
	  $count = 0;
	  $rows = 1;
   ?>
<div class="occountdown_module quickview-added">
	<div class="countdown-container">
	<div class="module-title">
		<h2>
		<?php 
			$title2 = explode(' ',$title,3); 
			for($i=0;$i<count($title2);$i++){ 
				$j=$i+1;
				echo $j>2 ? "<span class='word2'> ".$title2[$i]." </span>" : "<span> ".$title2[$i]." </span>";
			}
		?>
		</h2>
	</div>
<?php if($products): ?>
	<div class="row">
	<div class="countdown-product-inner">
    <?php foreach ($products as $product) : ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
            <div class="product-layout product-grid">
					<div class="product-thumb layout2">		
						<div class="image">
							<a class="product-image" href="<?php echo $product['href']; ?>">
								<?php if ($product['thumb']) { ?>					
										<?php if($product['rotator_image']){ ?>
											<img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
										<?php } ?>
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
								  <?php } else { ?>
									<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
								  <?php } ?>
							</a>
							<?php if($config_slide['f_show_label']): ?>
								<?php if($product['is_new'] && !$product['special']){ ?>
								  <div class="label-product">
									  <span><?php echo $text_new; ?></span>
								  </div>
								  <?php } if(($product['special'] && $product['is_new'])||($product['special'] && !$product['is_new'])) { ?>
								  <div class="label-product l-sale">
									  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
								  </div>
								  <?php }?>
							<?php endif; ?>
							</div><!-- image -->					
						<div class="product-inner">
							<div class="product-caption">								
								<?php if ($product['tags']) { ?>
							  <p class="tags-product">
								<?php for ($i = 0; $i < count($product['tags']); $i++) { ?>
								<?php if ($i < (count($product['tags']) - 1)) { ?>
								<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>,
								<?php } else { ?>
								<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>
								<?php } ?>
								<?php } ?>
							  </p>
						  <?php } ?>
								<h2 class="product-name">
									<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
								</h2>
								<?php if (isset($product['rating'])) { ?>
									<div class="ratings">
										<div class="rating-box">
											<?php for ($i = 0; $i <= 5; $i++) { ?>
												<?php if ($product['rating'] == $i) {
													$class_r= "rating".$i;
													echo '<div class="'.$class_r.'">rating</div>';
												} 
											}  ?>
										</div>									
									</div>
								<?php } ?>
								<?php if ($product['price']) { ?>
									<p class="price">
									  <?php if (!$product['special']) { ?>
										<?php echo $product['price']; ?>
									  <?php } else { ?>
											<span class="price-old"><?php echo $product['price']; ?></span>
											<span class="price-new"><?php echo $product['special']; ?></span>									
									  <?php } ?>
									</p>
								<?php } ?>
								<div class="product-des"><?php echo $product['description']; ?></div>
						<?php if(strtotime($product['date_end'])) { ?>
							<div id="Countdown<?php echo $product['product_id']?>" class="box-timer">
								<div class="block-timer">
									<input class="knob days" data-max="3650">
									<span><?php echo $text_days ?></span>
								</div>
								<div class="block-timer">
									<input class="knob hour" data-max="24">
									<span><?php echo $text_hours ?></span>
								</div>
								<div class="block-timer">
									<input class="knob minute" data-max="60">
									<span><?php echo $text_minutes ?></span>
								</div>
								<div class="block-timer">				
									<input class="knob second" data-max="60">
									<span><?php echo $text_seconds ?></span>
								</div>
							</div>
							<?php if(strtotime($product['date_end'])) { ?>
								<script type="text/javascript">
									$('#Countdown<?php echo $product['product_id']?>').ccountdown(<?php echo date("Y",strtotime($product['date_end']))?>,<?php echo date("m",strtotime($product['date_end']))?>,<?php echo date("d",strtotime($product['date_end']))?>,<?php echo "'".date("H",strtotime($product['date_end'])).":" ?>,<?php echo date("s",strtotime($product['date_end']))."'" ?>);
									$(".knob").knob({
										min: 0,
										readOnly: true,
										thickness: ".05",
										width: "100%",
										height: "100%",
										displayPrevious: "true",
										fgColor: "#cea679",
										inputColor: "#222222",
										fontWeight: "600",
										bgColor: "#dee4e8",
										font: "Open Sans, sans-serif",
									});
								</script>
							<?php } ?>
						<?php } ?>
						
						<div class="product-intro">
							<div class="actions-link">
								<a class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_cart; ?></a>
								<a class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></a>
								<a class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></a>						
							</div>						
						</div>
						
					</div>
					</div><!-- product-inner -->					
				</div>				
				</div>
				<?php if($count % $rows == 0 || $count == count($products)): ?>
					</div>
				<?php endif; ?>
    <?php endforeach;  ?>
	</div>
	</div>
<?php else: ?>
<p><?php echo $text_empty; ?></p>
<?php endif; ?>
	</div>
</div>

<script type="text/javascript">
	$('.countdown-product-inner').owlCarousel({
		autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [768,1],
		itemsMobile : [480,1],
		slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 2000;} ?>,
		paginationSpeed : 3000,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		scrollPerPage:true,
		navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
		addClassActive: true,
		lazyLoad : true,
		afterMove: function(){
			x = $( ".countdown-tab-content .owl-pagination .owl-page" ).index( $( ".countdown-tab-content .owl-pagination .active" ));
			var thumbinner = ".thumbinner"+x;
			$(".list-thumb .thumb li").removeClass('active');
			$(thumbinner).addClass('active');
		}
	});
	
	var owltimerslider = $(".countdown-product-inner").data('owlCarousel');
	function timerslider(x){
		owltimerslider.goTo(x)
	}
</script>