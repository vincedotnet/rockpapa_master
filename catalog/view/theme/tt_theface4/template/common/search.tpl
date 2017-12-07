<div class="search-container">
	<i class="fa fa-search"></i>
	<div id="search" class="input-group">			
		<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
		<!-- <i class="pe-7s-search"></i> -->
		<button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('.search-container > i').click(function(){
			$("#search").slideToggle();
			$(this).toggleClass("fa-search fa-close")
		});
	});
</script>