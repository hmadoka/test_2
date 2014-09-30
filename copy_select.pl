use strict;
use warnings;
use File::Find::Rule;
use File::Copy;


my $dir = "/Volumes/4T/RAW_backup";
my $src = "";
my $to = "/Volumes/4T/mov1/";  #마지막 슬래시 필수



#my $dir = "/Users/hmadoka/test";
#my $src = "";
#my $to = "/Users/hmadoka/del/";  #마지막 슬래시 필수



my @target_files = File::Find::Rule->file()
							->name('*.mov','*.MOV')
							->in($dir);
							


foreach  $src(@target_files){
								
			print "full URL= ".$src."\n";
			(my $volume, my $url, my $filename)=File::Spec->splitpath($src);
		
		 $url =~ /.*\/(.*)\/$/;
		#print $url."\n";
		#print $1."\n";
		#print $filename;	
		
		  # 파일 존재 여부 판단
		  if (-f "$to$1"."_"."$filename") {
		    print "파일 있음\n";
		  }
		  else {
		    copy ("$src","$to$1"."_"."$filename");
		  }
			
				
								}					
			
							
