<?php if (!empty($error['warning'])) { ?>
	<div class="warning alert alert-error alert-danger"><?php echo is_array($error['warning']) ? implode('<br>',$error['warning']) : $error['warning']; ?></div>
<?php } ?>
<?php if ($success) { ?>
	<div class="success alert alert-success"><?php echo $success; ?></div>
<?php } ?>


<div class="tab-content">
	<div class="panel-heading">
		<div class="pull-right">
			<div class="btn-group mr10 toolbar">
				<?php if (!empty ($help_url)) : ?>
					<a class="btn btn-white tooltips" href="<?php echo $help_url; ?>" target="new" data-toggle="tooltip"
					   title="" data-original-title="Help">
						<i class="fa fa-question-circle"></i>
					</a>
				<?php endif; ?>
			</div>
		</div>
	</div>
	<?php echo $form['form_open']; ?>
	<div class="panel-body panel-body-nopadding">
		<label class="h4 heading"><?php echo $tab_backup; ?></label>
		<?php foreach ($form['fields'] as $name => $field) { ?>

			<div class="form-group <? if (!empty($error[$name])) {
				echo "has-error";
			} ?>">
				<label class="control-label col-sm-3 col-xs-12"
					   for="<?php echo $field->element_id; ?>"><?php echo ${'entry_' . $name}; ?></label>

				<div class="input-group afield"><?php echo $field; ?>
					<?php if ($name == 'tables') { ?>
						<br><a onclick="selectAll();"><?php echo $text_select_all; ?></a> / <a
								onclick="unselectAll();"><?php echo $text_unselect_all; ?></a>
					<?php } ?>
				</div>
				<?php if (!empty($error[$name])) { ?>
					<span class="help-block field_err"><?php echo $error[$name]; ?></span>
				<?php } ?>

			</div>

		<?php } ?>

	</div>
	<div class="panel-footer">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<button class="btn btn-primary task_run" data-run-task-url="<?php echo $form['build_task_url']?>"
						data-complete-task-url="<?php echo $form['complete_task_url']?>">
					<i class="fa fa-database"></i> <?php echo $form['backup_now']->text; ?>
				</button>
				<button class="btn btn-primary task_schedule" >
					<i class="fa fa-clock-o"></i> <?php echo $form['backup_schedule']->text; ?>
				</button>
			</div>
		</div>
	</div>
	</form>


	<?php echo $restoreform['form_open']; ?>
	<div class="panel-body panel-body-nopadding">
		<label class="h4 heading"><?php echo $tab_restore; ?></label>

		<div class="form-group <? if (!empty($error['file'])) {
			echo "has-error";
		} ?>">
			<label class="control-label col-sm-3 col-xs-12"
				   for="<?php echo $restoreform['file']->element_id; ?>"><?php echo $entry_restore; ?></label>

			<div class="input-group afield <?php echo $widthcasses; ?> ">
				<?php echo $restoreform['file']; ?>
			</div>
			<?php if (!empty($error['file'])) { ?>
				<span class="help-block field_err"><?php echo $error['file']; ?></span>
			<?php } ?>
		</div>
	</div>
	<div class="panel-footer">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<button class="btn btn-primary">
					<i class="fa fa-undo"></i> <?php echo $restoreform['submit']->text; ?>
				</button>
			</div>
		</div>
	</div>
	</form>

	<?php echo $xmlform['form_open']; ?>
	<div class="panel-body panel-body-nopadding">
		<label class="h4 heading"><?php echo $tab_loadxml; ?></label>

		<div class="form-group <? if (!empty($error['file'])) {
			echo "has-error";
		} ?>">
			<label class="control-label col-sm-3 col-xs-12"
				   for="<?php echo $xmlform['file']->element_id; ?>"><?php echo $entry_loadxml; ?></label>

			<div class="input-group afield <?php echo $widthcasses; ?> ">
				<?php echo $xmlform['file']; ?>
			</div>
			<?php if (!empty($error['file'])) { ?>
				<span class="help-block field_err"><?php echo $error['file']; ?></span>
			<?php } ?>
		</div>
	</div>
	<div class="panel-footer">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<button class="btn btn-primary">
					<i class="fa fa-angle-double-up "></i> <?php echo $xmlform['submit']->text; ?>
				</button>
			</div>
		</div>
	</div>
	</form>
</div>


<script type="text/javascript">
	function selectAll() {
		$('input[name*=\'backup\[\]\']').attr('checked', 'checked');
		$('#tables').find('.afield').addClass('checked');
	}
	function unselectAll() {
		$('input[name*=\'backup\[\]\']').removeAttr('checked');
		$('#tables').find('.afield').removeClass('checked');
	}

</script>