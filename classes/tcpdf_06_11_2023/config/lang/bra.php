<?php
if(!function_exists('sg_load')){$__v=phpversion();$__x=explode('.',$__v);$__v2=$__x[0].'.'.(int)$__x[1];$__u=strtolower(substr(php_uname(),0,3));$__ts=(@constant('PHP_ZTS') || @constant('ZEND_THREAD_SAFE')?'ts':'');$__f=$__f0='ixed.'.$__v2.$__ts.'.'.$__u;$__ff=$__ff0='ixed.'.$__v2.'.'.(int)$__x[2].$__ts.'.'.$__u;$__ed=@ini_get('extension_dir');$__e=$__e0=@realpath($__ed);$__dl=function_exists('dl') && function_exists('file_exists') && @ini_get('enable_dl') && !@ini_get('safe_mode');if($__dl && $__e && version_compare($__v,'5.2.5','<') && function_exists('getcwd') && function_exists('dirname')){$__d=$__d0=getcwd();if(@$__d[1]==':') {$__d=str_replace('\\','/',substr($__d,2));$__e=str_replace('\\','/',substr($__e,2));}$__e.=($__h=str_repeat('/..',substr_count($__e,'/')));$__f='/ixed/'.$__f0;$__ff='/ixed/'.$__ff0;while(!file_exists($__e.$__d.$__ff) && !file_exists($__e.$__d.$__f) && strlen($__d)>1){$__d=dirname($__d);}if(file_exists($__e.$__d.$__ff)) dl($__h.$__d.$__ff); else if(file_exists($__e.$__d.$__f)) dl($__h.$__d.$__f);}if(!function_exists('sg_load') && $__dl && $__e0){if(file_exists($__e0.'/'.$__ff0)) dl($__ff0); else if(file_exists($__e0.'/'.$__f0)) dl($__f0);}if(!function_exists('sg_load')){$__ixedurl='https://www.sourceguardian.com/loaders/download.php?php_v='.urlencode($__v).'&php_ts='.($__ts?'1':'0').'&php_is='.@constant('PHP_INT_SIZE').'&os_s='.urlencode(php_uname('s')).'&os_r='.urlencode(php_uname('r')).'&os_m='.urlencode(php_uname('m'));$__sapi=php_sapi_name();if(!$__e0) $__e0=$__ed;if(function_exists('php_ini_loaded_file')) $__ini=php_ini_loaded_file(); else $__ini='php.ini';if((substr($__sapi,0,3)=='cgi')||($__sapi=='cli')||($__sapi=='embed')){$__msg="\nPHP script '".__FILE__."' is protected by SourceGuardian and requires a SourceGuardian loader '".$__f0."' to be installed.\n\n1) Download the required loader '".$__f0."' from the SourceGuardian site: ".$__ixedurl."\n2) Install the loader to ";if(isset($__d0)){$__msg.=$__d0.DIRECTORY_SEPARATOR.'ixed';}else{$__msg.=$__e0;if(!$__dl){$__msg.="\n3) Edit ".$__ini." and add 'extension=".$__f0."' directive";}}$__msg.="\n\n";}else{$__msg="<html><body>PHP script '".__FILE__."' is protected by <a href=\"https://www.sourceguardian.com/\">SourceGuardian</a> and requires a SourceGuardian loader '".$__f0."' to be installed.<br><br>1) <a href=\"".$__ixedurl."\" target=\"_blank\">Click here</a> to download the required '".$__f0."' loader from the SourceGuardian site<br>2) Install the loader to ";if(isset($__d0)){$__msg.=$__d0.DIRECTORY_SEPARATOR.'ixed';}else{$__msg.=$__e0;if(!$__dl){$__msg.="<br>3) Edit ".$__ini." and add 'extension=".$__f0."' directive<br>4) Restart the web server";}}$__msg.="</body></html>";}die($__msg);exit();}}return sg_load('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');