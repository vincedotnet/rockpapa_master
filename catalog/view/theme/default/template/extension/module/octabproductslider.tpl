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
<div class="product-tabs-container-slider">
<div class="container">
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
	<div class="tab_container">
		
		<div class="title-product-tabs">
		<ul class="tabs col-sm-3"> 
			<?php $count=0; ?>
			<?php foreach($productTabslider as $productTab ){ ?>
				<li rel="tab_<?php echo $productTab['id']; ?>"  >
					<h3 class="tab_<?php echo $productTab['id']; ?>"><?php echo $productTab['name']; ?></h3>
				</li>
					<?php $count= $count+1; ?>
			<?php } ?>	
			</ul>
		</div>
		<?php foreach($productTabslider as $productTab){ ?>
			<div id="tab_<?php echo $productTab['id']; ?>" class="tab_content col-sm-9 quickview-added qv-wtext">
				<div class="row">
				<div class="owl-demo-tabproduct">
                <?php if($productTab['productInfo']): ?>
                    <?php
                        $count = 0;
                        $rows = $config_slide['f_rows'];
                        if(!$rows) { $rows=1; }
                    ?>
                    <?php foreach ($productTab['productInfo'] as $product) { ?>
                        <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
                            <div class="product-layout product-grid">
		  <div class="product-thumb layout1">
			  <div class="image">
			  <?php if($config_slide['f_show_label']): ?>
					<?php if($product['is_new'] && !$product['special']){ ?>
						  <div class="label-product l-new">
							  <span><?php echo $text_new; ?></span>
						  </div>
						  <?php } if(($product['special'] && $product['is_new'])||($product['special'] && !$product['is_new'])) { ?>
						  <div class="label-product l-sale">
							  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
						  </div>
					  <?php }?>			  
				<?php endif;?>
			  <a href="<?php echo $product['href']; ?>">
			  <?php if ($product['thumb']) { ?>					
					<?php if($product['rotator_image']){ ?>
						<img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
					<?php } ?>
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
			  <?php } else { ?>
				<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
			  <?php } ?>
			  </a>
			  <div class="actions-link">
						<a class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i><span><?php echo $button_wishlist; ?></span></a>
								<a class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i><span><?php echo $button_compare; ?></span></a>
					</div>
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
					<div class="actions-link2">
						<?php if($config_slide['f_show_addtocart']) { ?>
							<a class="btn-cart" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								<i class="fa fa-shopping-bag"></i><span class="button"><?php echo $button_cart; ?></span>
							</a>
						<?php } ?>
					</div>
				</div>
			  </div>
			  
			</div>
		  </div>
		</div>
                        <?php if($count % $rows == 0 || $count == count($productTab['productInfo'])) { echo '</div>'; } ?>
                    <?php } ?>
                <?php else: ?>
                    <p><?php echo $productTab['text_empty']; ?></p>
                <?php endif; ?>
				</div>
				</div><!-- .row -->
			</div>

		<?php } ?>
	
	</div>
	</div><!-- .tab_container -->
</div>
<script type="text/javascript">
$(document).ready(function() { 
 $(".product-tabs-container-slider .tabs li:first").addClass("active");
  $(".owl-demo-tabproduct").owlCarousel({
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
		slideSpeed: <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 3000;} ?>,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		paginationNumbers : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : false,
		itemsDesktop : [1199,4], 
		itemsDesktopSmall : [980,3], 
		itemsTablet: [768,2], 
		itemsMobile : [479,1]
  });
 
});
</script>



