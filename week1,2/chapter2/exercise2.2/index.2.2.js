const fs = require('fs');
const path = require('path');

const dir='./test/'

const dirsearch = currentdir =>{
    fs.readdir(currentdir, function(err, filelist){
        if(err){
            console.error("error running the program");
        }
        else{
            for(const file of filelist){
                fs.stat(currentdir+file, (err, todetermine) =>{
                    if(err){
                        console.error("error running the program");
                    }else if(todetermine.isDirectory()){
                        dirsearch(currentdir+file+'/');
                    }else if(path.extname(file)==='.js'){
                        console.log(path.join(currentdir, file));
                    }
                });
            }
        }
        });
}

dirsearch(dir);












