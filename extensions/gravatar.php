<?php

class Gravatar extends Orbit{
	public $gravatar_default;
	public $gravatar_size;
	public $gravatar_max_rating;
	
	public function __construct(){
		parent::__construct();
		
		$this->gravatar_size = $this->readPref('gravatar_size');
		$this->gravatar_default = $this->readPref('gravatar_default');
		$this->gravatar_max_rating = $this->readPref('gravatar_max_rating');
		
		if(empty($this->gravatar_size) or !intval($this->gravatar_size)){
			$this->gravatar_size = 80;
		}
	}
	
	public function __destruct(){
		parent::__destruct();
	}
	
	public function comment_add($fields){
		$email = $fields['comment_author_email'];
		$gravatar = 'http://www.gravatar.com/avatar/' . md5(strtolower(trim($email))) . '?d=' . urlencode($this->gravatar_default) . '&s=' . $this->gravatar_size . '&r=' . $this->gravatar_max_rating . '&$img=false';
		$fields['comment_author_avatar'] = $gravatar;
		return $fields;
	}
	
	public function config(){
		?>
		<p>For more information on Gravatar, visit <a href="http://www.gravatar.com/">Gravatar&#8217;s Web site</a>.</p>

		<table>
			<tr>
				<td class="right" style="padding-top: .75em;">Avatar size (in pixels):</td>
				<td><input type="text" name="gravatar_size" value="<?php echo $this->gravatar_size; ?>" style="width: 3em;" /></td>
			</tr>
			<tr>
				<td class="right" style="padding-top: .75em;">Default avatar (optional):</td>
				<td>
					<input type="text" name="gravatar_default" value="<?php echo $this->gravatar_default; ?>" style="width: 40em;" /><br />
					<span class="quiet">Full URL of avatar image file</span>
				</td>
			</tr>
			<tr>
				<td class="right" style="padding-top: .6em;">Maximum rating (optional):</td>
				<td>
					<select name="gravatar_max_rating">
						<option value="g"<?php if($this->gravatar_max_rating == 'g'){ echo ' selected="selected"'; } ?>>G</option>
						<option value="pg"<?php if($this->gravatar_max_rating == 'pg'){ echo ' selected="selected"'; } ?>>PG</option>
						<option value="r"<?php if($this->gravatar_max_rating == 'r'){ echo ' selected="selected"'; } ?>>R</option>
						<option value="x"<?php if($this->gravatar_max_rating == 'x'){ echo ' selected="selected"'; } ?>>X</option>
					</select>
				</td>
			</tr>
		</table>
		<?php
	}
	
	public function config_save(){
		if(isset($_POST['gravatar_size'])){
			$this->setPref('gravatar_size', $_POST['gravatar_size']);
			$this->setPref('gravatar_default', $_POST['gravatar_default']);
			$this->setPref('gravatar_max_rating', $_POST['gravatar_max_rating']);
			$this->savePref();
			
			if($_POST['gravatar_size'] != $this->gravatar_size){
				$query = $this->prepare('SELECT comment_id, comment_author_avatar FROM comments WHERE LOWER(comment_author_avatar) LIKE :comment_author_avatar;');
				$query->execute(array(':comment_author_avatar' => '%www.gravatar.com%'));
				$comments = $query->fetchAll();
				
				if(@count($comments) > 0){
					$query = $this->prepare('UPDATE comments SET comment_author_avatar = :comment_author_avatar WHERE comment_id = :comment_id;');
					foreach($comments as $comment){
						$comment_author_avatar = preg_replace('#\&s=(.*?)&#si', '&s=' . $_POST['gravatar_size'] . '&', $comment['comment_author_avatar']);
						$query->execute(array(':comment_author_avatar' => $comment_author_avatar, ':comment_id' => $comment['comment_id']));
					}
				}
			}
			
			if($_POST['gravatar_default'] != $this->gravatar_default){
				$query = $this->prepare('SELECT comment_id, comment_author_avatar FROM comments WHERE LOWER(comment_author_avatar) LIKE :comment_author_avatar;');
				$query->execute(array(':comment_author_avatar' => '%www.gravatar.com%'));
				$comments = $query->fetchAll();
				
				if(@count($comments) > 0){
					$query = $this->prepare('UPDATE comments SET comment_author_avatar = :comment_author_avatar WHERE comment_id = :comment_id;');
					foreach($comments as $comment){
						$comment_author_avatar = preg_replace('#\?d=(.*?)&#si', '?d=' . urlencode($_POST['gravatar_default']) . '&', $comment['comment_author_avatar']);
						$query->execute(array(':comment_author_avatar' => $comment_author_avatar, ':comment_id' => $comment['comment_id']));
					}
				}
			}
			
			if($_POST['gravatar_max_rating'] != $this->gravatar_max_rating){
				$query = $this->prepare('SELECT comment_id, comment_author_avatar FROM comments WHERE LOWER(comment_author_avatar) LIKE :comment_author_avatar;');
				$query->execute(array(':comment_author_avatar' => '%www.gravatar.com%'));
				$comments = $query->fetchAll();
				
				if(@count($comments) > 0){
					$query = $this->prepare('UPDATE comments SET comment_author_avatar = :comment_author_avatar WHERE comment_id = :comment_id;');
					foreach($comments as $comment){
						$comment_author_avatar = preg_replace('#\&r=(.*?)&#si', '&r=' . $_POST['gravatar_max_rating'] . '&', $comment['comment_author_avatar']);
						$query->execute(array(':comment_author_avatar' => $comment_author_avatar, ':comment_id' => $comment['comment_id']));
					}
				}
			}
		}
	}
}

?>