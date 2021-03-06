library Templates;

import 'dart:io';
 
part 'tag.dart';
part 'block.dart';
part 'template_factory.dart' ;
part 'template.dart' ;
part 'include.dart' ;
part 'template_parser.dart';
/*
* Regular expressions below are used in the library to accomplish specific tasks.
* 
* BLOCK_REG_EX - identifies a block opening and closing tag. The block 
* identified will be the most outer of all blocks found in the source string 
* that begin with {{#<tagname>}}, and that end in {{/<tagname>}}. The expression
* is designed such that when performing matches using RegExp in Dart, the entire
* match including surrounding tags can be retrieved using m.match(0). The 
* contents between the opening and closing tag can be retrieved using m.match(2).
* The tag label can be retrieved using m.match(1);
*
* VAR_REG_EX - identifies variables (that will eventually be replaced) within 
* the source string that are delimited with {{ opening tags and }} closing tags.
*
* INCLUDE_REG_EX - identifies variables within the source string that are
* delimited with {{> opening tags and }} closing tags.
*/

final RegExp BLOCK_REG_EX = new RegExp('.*{{#(.+?)}}.*\\n([\\s\\S]+)(\\n.*){{\/\\1}}');
final RegExp VAR_REG_EX = new RegExp('{{([\^>].+?)}}');
final RegExp INCLUDE_REG_EX = new RegExp('{{>(.+?)}}');
