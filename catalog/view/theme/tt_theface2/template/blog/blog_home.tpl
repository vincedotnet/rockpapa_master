<div id="blog_home" class="menu-recent">
	 <div class="container">
		  <div class="blog-title module-title">
			   <h2><?php echo $title; ?></h2>
		  </div>
		<?php
			$count = 0;
			$rows = $slide['rows'];
			if(!$rows) { $rows = 1;}
			$j=0;
		?>
	 <?php if ($articles) { ?>
      <div class="row">
      <div class="articles-container">
        <?php foreach ($articles as $key=>$article) { $j++; ?>
		  <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; }  $count++; ?>
          <div class="articles-inner item-inner">
			   <div class="articles-image">
					<img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>"/>					
			   </div>
			   <div class="articles-content">			   
					<a class="articles-name" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
				   <div class="articles-date">				
						<i class="fa-calendar fa"></i>						
						<?php echo $article['date_added']; ?>
						<?php if($article['author'] != null && $article['author'] != ""): ?>					
							<?php echo $text_post_by.'<span>'.$article['author'].'</span>'; ?>
						<?php endif; ?>
				   </div>				   
				   <div class="articles-intro"><?php echo $article['intro_text']; ?></div>			   
				   <div class="readmore"><a href="<?php echo $article['href']; ?>"><?php echo $button_read_more; ?></a></div>
			   </div>
          </div>
		  <?php if($count % $rows == 0 || $count == count($articles)): ?>
	  		</div>
		 <?php endif; ?>
        <?php } ?>
      </div>
      </div>
      <?php } ?>
	  
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
	  </div>
 <script>
 $(document).ready(function() { 
	  $(".articles-container").owlCarousel({
			autoPlay : <?php if($slide['auto']) { echo 'true' ;} else { echo 'false'; } ?>,
			items : <?php echo $slide['items'] ?>,
			itemsDesktop : [1199,3],
			itemsDesktopSmall : [991,2],
			itemsTablet: [768,2],
			itemsMobile : [480,1],
			slideSpeed : <?php echo $slide['speed']; ?>,
			paginationSpeed : <?php echo $slide['speed']; ?>,
			rewindSpeed : <?php echo $slide['speed']; ?>,
			navigation : <?php if($slide['navigation']) { echo 'true' ;} else { echo 'false'; } ?>,
			pagination : <?php if($slide['pagination']) { echo 'true' ;} else { echo 'false'; } ?>,
			stopOnHover : true,
			addClassActive: true,
			navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
	  });
 });
 </script>
</div>
