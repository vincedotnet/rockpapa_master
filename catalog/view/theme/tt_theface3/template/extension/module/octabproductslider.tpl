<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">
$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});
</script>
<div class="product-tabs-container-slider quickview-added qv-wtext">
<div>
	<div class="title-product-tabs">
		<div>
		<div class="module-title">
			<h2><?php echo $title; ?></h2>
		</div>
			<ul class="tabs"> 
			<?php $count=0; ?>
			<?php foreach($productTabslider as $productTab ){ ?>
				<li rel="tab_<?php echo $productTab['id']; ?>"  >
					<h3 class="tab_<?php echo $productTab['id']; ?>"><?php echo $productTab['name']; ?></h3>
				</li>
					<?php $count= $count+1; ?>
			<?php } ?>	
			</ul>
		</div>
	</div>
	<div class="tab_container">
		<?php foreach($productTabslider as $productTab){ ?>
			<div id="tab_<?php echo $productTab['id']; ?>" class="tab_content">
				<div class="row">
				<div class="owl-demo-tabproduct">
                <?php if($productTab['productInfo']): ?>
                    <?php
                        $count = 0;
                        $rows = $config_slide['f_rows'];
						$limit = 9;
                        if(!$rows) { $rows=1; }
						$customProducts = getAllProductsByCustomBlock($productTab['productInfo']);
                    ?>
					
					<div class="top-row">
						<?php foreach ($customProducts['onetofour'] as $product) :?>
						<div class="items">
							<div class="product-layout product-grid">
								  <div class="product-thumb layout1">
									  <div class="image">
									  <?php if($config_slide['f_show_label']): ?>
										  <?php if($product['is_new']){ ?>
											  <div class="label-product">
												  <span><?php echo $text_new; ?></span>
											  </div>
										  <?php } if($product['special']) { ?>
											  <div class="label-product l-sale">
												  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
											  </div>
										  <?php }?>
									  <?php endif;?>
									  <a href="<?php echo $product['href']; ?>">
									  <?php if ($product['thumb']) { ?>
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
										<?php if($product['rotator_image']){ ?><img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
									  <?php } else { ?>
										<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
									  <?php } ?>
									  </a>
									  
									</div>
									<div class="product-inner">
									  <div class="product-caption">
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
									  <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
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
									  <?php if($config_slide['f_show_des']) { ?>
										<p class="product-des"><?php echo $product['description']; ?></p>
										<?php } ?>
									  <?php if($config_slide['f_show_price']) { ?>
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
										<?php } ?>
									  
									  <div class="product-intro">
											<div class="actions-link">				
												<?php if($config_slide['f_show_addtocart']) { ?>
														<a class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_cart; ?></a>
													<?php } ?>
												<a class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></a>
												<a class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></a>						
											</div>					
										</div>
									  </div>
									  
									</div>
								  </div>
								</div>
						</div>
						<?php endforeach; ?>
					</div>
					
					<div class="bottom-row">
						<div class="col-sm-12 col-md-6 bottom-left">
							<div class="row">
								<?php if($customProducts['fivetoeight']): ?>
									<?php foreach ($customProducts['fivetoeight'] as $product) :?>
								<div class="col-sm-6">
									<div class="product-layout product-grid">
										  <div class="product-thumb layout1">
											  <div class="image">
											  <?php if($config_slide['f_show_label']): ?>
												  <?php if($product['is_new']){ ?>
													  <div class="label-product">
														  <span><?php echo $text_new; ?></span>
													  </div>
												  <?php } if($product['special']) { ?>
													  <div class="label-product l-sale">
														  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
													  </div>
												  <?php }?>
											  <?php endif;?>
											  <a href="<?php echo $product['href']; ?>">
											  <?php if ($product['thumb']) { ?>
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
												<?php if($product['rotator_image']){ ?><img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
											  <?php } else { ?>
												<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
											  <?php } ?>
											  </a>
											  
											</div>
											<div class="product-inner">
											  <div class="product-caption">
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
											  <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
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
											  <?php if($config_slide['f_show_des']) { ?>
												<p class="product-des"><?php echo $product['description']; ?></p>
												<?php } ?>
											  <?php if($config_slide['f_show_price']) { ?>
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
												<?php } ?>
											  
											  <div class="product-intro">
													<div class="actions-link">				
														<?php if($config_slide['f_show_addtocart']) { ?>
																<a class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_cart; ?></a>
															<?php } ?>
														<a class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></a>
														<a class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></a>						
													</div>					
												</div>
											  </div>
											  
											</div>
										  </div>
										</div>
								</div>
								<?php endforeach; ?>
								<?php endif; ?>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 bottom-right">
							<?php if($customProducts['last']): ?>
								<?php $product = $customProducts['last']; ?>
								<div class="product-layout product-grid">
								  <div class="product-thumb layout1">
									  <div class="image">
									  <?php if($config_slide['f_show_label']): ?>
										  <?php if($product['is_new']){ ?>
											  <div class="label-product">
												  <span><?php echo $text_new; ?></span>
											  </div>
										  <?php } if($product['special']) { ?>
											  <div class="label-product l-sale">
												  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
											  </div>
										  <?php }?>
									  <?php endif;?>
									  <a href="<?php echo $product['href']; ?>">
									  <?php if ($product['thumb']) { ?>
										<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
										<?php if($product['rotator_image']){ ?><img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
									  <?php } else { ?>
										<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
									  <?php } ?>
									  </a>
									  
									</div>
									<div class="product-inner">
									  <div class="product-caption">
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
									  <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
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
									  <?php if($config_slide['f_show_des']) { ?>
										<p class="product-des"><?php echo $product['description']; ?></p>
										<?php } ?>
									  <?php if($config_slide['f_show_price']) { ?>
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
										<?php } ?>
									  
									  <div class="product-intro">
											<div class="actions-link">				
												<?php if($config_slide['f_show_addtocart']) { ?>
														<a class="btn-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-plus"></i><?php echo $button_cart; ?></a>
													<?php } ?>
												<a class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></a>
												<a class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></a>						
											</div>					
										</div>
									  </div>
									  
									</div>
								  </div>
								</div>
							<?php endif; ?>
							
							
						</div>
					</div>
                    
                <?php else: ?>
                    <p><?php echo $productTab['text_empty']; ?></p>
                <?php endif; ?>
				</div>
				</div><!-- .row -->
			</div>
		<?php } ?>
	</div><!-- .tab_container -->
</div>
</div>
<?php function getAllProductsByCustomBlock($products) {
	$allProducts = array();
	$allProducts['onetofour'] = array();
	$allProducts['fivetoeight'] = array();
	$allProducts['last'] = null;
	$count = 0;
	
	foreach($products as $product) {
		if($count < 4) {
			$allProducts['onetofour'][] = $product;
		}
		
		if($count >= 4 && $count < 8) {
			$allProducts['fivetoeight'][] = $product;
		}
		
		if($count >= 8 && $count < 9) {
			$allProducts['last'] = $product;
		}
		
		if($count >= 9) break;
		$count++;
	}
	
	return $allProducts;
}
?>
<script type="text/javascript">
$(document).ready(function() { 
 $(".product-tabs-container-slider .tabs li:first").addClass("active");
 $(".owl-demo-tabproduct .top-row").owlCarousel({
		items : 4,
		autoPlay : false,
		slideSpeed: 1000,
		navigation : false,
		paginationNumbers : true,
		pagination : false,
		stopOnHover : false,
		itemsDesktop : [1199,4], 
		itemsDesktopSmall : [991,2], 
		itemsTablet: [768,2], 
		itemsMobile : [480,1],
		navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
  });
});
</script>