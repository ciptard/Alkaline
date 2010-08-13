<div id="primary" class="column">
	<a href="<?php echo BASE . ADMIN; ?>dashboard/"><img src="/images/alkaline.png" alt="Alkaline" class="bumper" /></a><br /><br />
	<ul id="navigation">
		<li><a href="<?php echo BASE . ADMIN; ?>dashboard/">Dashboard</a><img src="/images/pointer.png" alt="" class="hide" /></li>
		<li><a href="<?php echo BASE . ADMIN; ?>library/">Library</a><img src="/images/pointer.png" alt="" /></li>
		<li><a href="<?php echo BASE . ADMIN; ?>features/">Features</a><img src="/images/pointer.png" alt="" class="hide" /></li>
		<li><a href="<?php echo BASE . ADMIN; ?>settings/">Settings</a><img src="/images/pointer.png" alt="" class="hide" /></li>
		<li><a href="http://www.alkalineapp.com/help/" target="_blank">Help</a><img src="/images/block_cyan.png" alt="" class="hide" /></li>
		<li class="logout"><a href="">Logout</a><img src="/images/block_red.png" alt="" /></li>
	</ul>
</div>
<div id="secondary" class="column">
	<p class="expand"><a href="">Expand &#9656;</a></p>
	
	<img src="/images/empty/64.png" alt="" class="bumper" /><br /><br />
	
	<img src="/images/iconblocks/blank.png" alt="" class="icon_block" />
	
	<p class="library">
		<?php
		
		function library(){
			$photo_ids = new Find();
			$photo_ids->page(1,100);
			$photo_ids->exec();
		
			$photos = new Photo($photo_ids->photo_ids);
			$photos->getImgUrl('square');
		
			foreach($photos->photos as $photo){
				?>
				<a href="<?php echo BASE . ADMIN . 'photo/' . $photo['photo_id']; ?>/">
					<img src="<?php echo $photo['photo_src_square']; ?>" alt="" title="<?php echo $photo['photo_title']; ?>" class="frame" />
				</a>
				<?php
			}
		}
		
		library();
		
		?>
	</p>
</div>
<div id="tertiary" class="column">
	<img src="/images/empty/64.png" alt="" class="bumper" /><br /><br />