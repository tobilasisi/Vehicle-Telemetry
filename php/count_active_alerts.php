<?php
require("db_access.php");

if (!debug_backtrace()) {
    header("content-type:application/json");

    echo json_encode(count_active_alerts());
}
?>