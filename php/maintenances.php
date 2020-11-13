<?php
require("db_access.php");

if (!debug_backtrace()) {
    header("content-type:application/json");
    echo json_encode(get_whole_table("Maintenance"));
}
?>