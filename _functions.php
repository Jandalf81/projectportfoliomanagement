<?php
	class Option {
		private $id;
		private $name;
		
		function __construct($id, $name) {
			$this->id = $id;
			$this->name = $name;
		}
		
		function get_id() {
			return $this->id;
		}
		
		function get_Name() {
			return $this->name;
		}
		
		function set_name($name) {
			$this->name = $name;
		}
	}
	
	class DropDownOptions {
		private $options = array();
		
		public function __construct(SQLite3 $db, $stmt) {
			$res = $db->query($stmt);
			while ($row = $res->fetchArray()) {
				$this->options[] = new Option("{$row['id']}", "{$row['name']}");
			}
		}
		
		public function listOptions() {
			foreach ($this->options as $option) {
				print "<option value='{$option->get_id()}'>{$option->get_Name()}</option>\n";
			}
		}
		
		public function listOptionsWithSelected($selected) {
			foreach ($this->options as $option) {
				if ($selected == $option->get_id()) {
					print "<option value='{$option->get_id()}' selected>{$option->get_Name()}</option>\n";
				} else {
					print "<option value='{$option->get_id()}'>{$option->get_Name()}</option>\n";
				}
			}
		}
	}
	
	class Person {
		private $id;
		private $vorname;
		private $nachname;
	
		function get_id() {
			return $this->id;
		}
		
		function get_Vorname() {
			return $this->vorname;
		}
		
		function get_Nachname() {
			return $this->nachname;
		}
		
		function get_Name() {
			return $this->nachname . ', ' . $this->vorname;
		}
	}
?>