package action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tool.Action;

public class FileAction extends Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

	FileItem fItem = null;
	FileItem fItem1 = null;
	String str_name = null;

	//(1)アップロードファイルを格納するPATHを取得
	Path path = Paths.get("C:/java_workspace/SD25/static/images");

	//(2)ServletFileUploadオブジェクトを生成
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);

	//(3)アップロードする際の基準値を設定
	factory.setSizeThreshold(1024);  //byte
	upload.setSizeMax(-1);	//-1はファイルサイズに制限なし

		//出力先ファイル名を取得
		//(4)ファイルデータ(FileItemオブジェクト)を取得し、
		//   Listオブジェクトとして返す
		List list = upload.parseRequest(request);

		//(5)ファイルデータ(FileItemオブジェクト)を順に処理
		Iterator iterator = list.iterator();
		while(iterator.hasNext()){
			fItem = (FileItem)iterator.next();
			//(6)フォームデータの場合
			if((fItem.isFormField())){
				//フォーム項目についての処理
				str_name = fItem.getFieldName();	// フォームのnameパラメータを取得
				fItem1.write(new File(path + "/" + str_name + ".jpg"));
			}else{
	        	//ファイルデータの場合
	        	 fItem1 = fItem; //ファイルデータを退避
	        }
		}

        request.setAttribute("fItem", fItem);
        request.setAttribute("fItem1", fItem1);
        request.setAttribute("str_name", str_name);

        return "/view/order/fileout.jsp";

    }

}
