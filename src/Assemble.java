/**
 * Eddie Graham
 * 1101301g
 * Individual Project 4
 * Supervisor: John T O'Donnell
 */

/*
 * 
 */
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import java.io.File;
import java.util.List;
import java.util.concurrent.Callable;

@Command(name = "Assemble", mixinStandardHelpOptions = true,
description = "outputs machine language for assembler file", version = "1101301g")

/*
 * The Generic-Assembler reads in two inputs: (1) a specification of the
 * computer architecture and assembly language, and (2) a source program written
 * in that assembly language. The software then outputs the corresponding
 * machine language result.
 */
public class Assemble implements Callable<Integer> {

    @Option(names = "-d", description = "Debug option") static boolean _debug;
    @Option(names = "-t", description = "Debug tree option") static boolean _debugTree;
    @Option(names = "-o", description = "Output file", defaultValue="") static File fOutP;
    @Option(names = "-e", description = "Error file", defaultValue="spec_error_report.log") static File fErr;
    @Option(names = "-s", description = "Specification file") static File fSpec;
    @Parameters(description = "Positional params", hidden=true) static List<String> positional;
    @Parameters(index = "0", description = "Assember Source file") static File fAsm;
    @Parameters(index = "1", description = "Output file", arity = "0..1", defaultValue="object_code.out") static File fOut;

    @Override
    public Integer call() {
    	if (fOutP.getName().length() != 0) fOut=fOutP;
    	if (_debug) {
	        System.out.printf("fOut=%s%n",  fOut.getName());
	        System.out.printf("fErr=%s%n",  fErr.getName());
	        System.out.printf("fSpec=%s%n", fSpec.getName());
	        System.out.printf("fAsm=%s%n",  fAsm.getName());
//	        System.out.printf("positionals=%s%n", positional);
    	}

		assert fAsm.exists() : "Assembly file not given or does not exist.";
		assert fSpec.exists() : "Specification (-s) file not given or does not exist.";

		FileParser file = new FileParser(fSpec, fAsm);
		DataSource data = file.getData();
		new Assembler(data);

        return 0;
    }

    public static boolean debug () {
    	return _debug;
    }
    
    public static boolean debugTree () {
    	return _debugTree;
    }

    public static File outFile () {
    	return fOut;
    }

    public static File errFile () {
    	return fErr;
    }

	public static void main(String[] args) {
        System.exit(new CommandLine(new Assemble()).execute(args));        
		}
}
