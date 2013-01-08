part of Templates;

class TemplateParser {
  TemplateParser(this.templateFactory);
  
  void compile(String filePath, Function callback, Function error) {
    print('Compile');
    File file = new File(filePath);
    InputStream inStream = file.openInputStream();
    StringInputStream reader = new StringInputStream(inStream);
    if (!file.existsSync()) {
      error(new Exception('Failed to find: $filePath'));
      exit;
    }
    Template result;
    
    print('Compile 100 ${file.fullPathSync()}');
    StringBuffer sb = new StringBuffer();
    
    reader.onLine = (){
      print('Compile 200 ');
      sb.add('${reader.readLine()}\n');
    };
    reader.onClosed = (){
      print('in onClosed');
      inStream.close();
      result = new Template(sb.toString());
      print(result);
      callback( result );
    };
    reader.onError = (e){
      print('Compile 300 ');
      error(e);
    };
    print('Compile 900 ${sb.toString()} ');
  }
  
  TemplateFactory templateFactory;
}
