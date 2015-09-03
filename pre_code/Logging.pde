import java.util.logging.*;

Logger logger;

/**
 * Creates and initializes a new logger instance.
 * @param file absolut path/pattern to log file
 * @param level minimum log level to consider
 * (use level "ALL" for all messages)
 *
 * See for more info/examles:
 * http://www.exampledepot.com/egs/java.util.logging/pkg.html
 */
void initLogger(String file,String level) {
  try {
    // create a single log file and append to it if possible
    FileHandler fh=new FileHandler(file,true);
    fh.setFormatter(new SimpleFormatter());
    logger = Logger.getLogger("myloggername");
    logger.addHandler(fh);
    logger.setLevel(Level.parse(level));
    logger.info("logger started...");
  }
  catch(IOException e) {
    e.printStackTrace();
  }
}
 