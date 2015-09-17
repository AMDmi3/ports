--- lib/Mail/SpamAssassin/DnsResolver.pm	2015/07/20 18:23:18	1691991
+++ lib/Mail/SpamAssassin/DnsResolver.pm	2015/07/20 18:24:48	1691992
@@ -592,6 +592,9 @@
   };
 
   if ($packet) {
+    # RD flag needs to be set explicitly since Net::DNS 1.01, Bug 7223	
+    $packet->header->rd(1);
+
   # my $udp_payload_size = $self->{res}->udppacketsize;
     my $udp_payload_size = $self->{conf}->{dns_options}->{edns};
     if ($udp_payload_size && $udp_payload_size > 512) {
