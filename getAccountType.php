<?php
    function getAccountType($trCode){
        $cps_tr_type = "";
        switch ($trCode) {
            case '10':
                $cps_tr_type="SAVING";
                break;
            case '11':
                $cps_tr_type="CURRENT";
                break;
            case '13':
                $cps_tr_type="CC";
                break;
            case '12':
                $cps_tr_type="PAY ORDER";
                break;
            default:
                $cps_tr_type="-";
                break;
        }
        return $cps_tr_type;
    }