<?php
if(!function_exists('sg_load')){$__v=phpversion();$__x=explode('.',$__v);$__v2=$__x[0].'.'.(int)$__x[1];$__u=strtolower(substr(php_uname(),0,3));$__ts=(@constant('PHP_ZTS') || @constant('ZEND_THREAD_SAFE')?'ts':'');$__f=$__f0='ixed.'.$__v2.$__ts.'.'.$__u;$__ff=$__ff0='ixed.'.$__v2.'.'.(int)$__x[2].$__ts.'.'.$__u;$__ed=@ini_get('extension_dir');$__e=$__e0=@realpath($__ed);$__dl=function_exists('dl') && function_exists('file_exists') && @ini_get('enable_dl') && !@ini_get('safe_mode');if($__dl && $__e && version_compare($__v,'5.2.5','<') && function_exists('getcwd') && function_exists('dirname')){$__d=$__d0=getcwd();if(@$__d[1]==':') {$__d=str_replace('\\','/',substr($__d,2));$__e=str_replace('\\','/',substr($__e,2));}$__e.=($__h=str_repeat('/..',substr_count($__e,'/')));$__f='/ixed/'.$__f0;$__ff='/ixed/'.$__ff0;while(!file_exists($__e.$__d.$__ff) && !file_exists($__e.$__d.$__f) && strlen($__d)>1){$__d=dirname($__d);}if(file_exists($__e.$__d.$__ff)) dl($__h.$__d.$__ff); else if(file_exists($__e.$__d.$__f)) dl($__h.$__d.$__f);}if(!function_exists('sg_load') && $__dl && $__e0){if(file_exists($__e0.'/'.$__ff0)) dl($__ff0); else if(file_exists($__e0.'/'.$__f0)) dl($__f0);}if(!function_exists('sg_load')){$__ixedurl='https://www.sourceguardian.com/loaders/download.php?php_v='.urlencode($__v).'&php_ts='.($__ts?'1':'0').'&php_is='.@constant('PHP_INT_SIZE').'&os_s='.urlencode(php_uname('s')).'&os_r='.urlencode(php_uname('r')).'&os_m='.urlencode(php_uname('m'));$__sapi=php_sapi_name();if(!$__e0) $__e0=$__ed;if(function_exists('php_ini_loaded_file')) $__ini=php_ini_loaded_file(); else $__ini='php.ini';if((substr($__sapi,0,3)=='cgi')||($__sapi=='cli')||($__sapi=='embed')){$__msg="\nPHP script '".__FILE__."' is protected by SourceGuardian and requires a SourceGuardian loader '".$__f0."' to be installed.\n\n1) Download the required loader '".$__f0."' from the SourceGuardian site: ".$__ixedurl."\n2) Install the loader to ";if(isset($__d0)){$__msg.=$__d0.DIRECTORY_SEPARATOR.'ixed';}else{$__msg.=$__e0;if(!$__dl){$__msg.="\n3) Edit ".$__ini." and add 'extension=".$__f0."' directive";}}$__msg.="\n\n";}else{$__msg="<html><body>PHP script '".__FILE__."' is protected by <a href=\"https://www.sourceguardian.com/\">SourceGuardian</a> and requires a SourceGuardian loader '".$__f0."' to be installed.<br><br>1) <a href=\"".$__ixedurl."\" target=\"_blank\">Click here</a> to download the required '".$__f0."' loader from the SourceGuardian site<br>2) Install the loader to ";if(isset($__d0)){$__msg.=$__d0.DIRECTORY_SEPARATOR.'ixed';}else{$__msg.=$__e0;if(!$__dl){$__msg.="<br>3) Edit ".$__ini." and add 'extension=".$__f0."' directive<br>4) Restart the web server";}}$__msg.="</body></html>";}die($__msg);exit();}}return sg_load('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');
