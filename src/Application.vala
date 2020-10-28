/*
* Copyright (c) 2011-2018 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <info@vipindev.com>
*/


public class HTTPReq : Gtk.Application {
    public HTTPReq () {
        Object (
            application_id: "com.github.vipin-dev.httpreq",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        Hdy.init();
        var main_window = active_window;
        if(main_window == null) {
            print("Requested window");
            main_window = new Hdy.ApplicationWindow();
            main_window.default_width = 600;
            main_window.default_height = 300;
        }

        var notebooks = new Granite.Widgets.DynamicNotebook();
        var notebook = new APINotebook();
        notebooks.new_tab_requested.connect(()=> {
            notebooks.insert_tab(new Granite.Widgets.Tab("First",null, new APINotebook()),1);
        });
        var gtk_headerbar = new Gtk.HeaderBar();
        notebooks.insert_tab(new Granite.Widgets.Tab("First",null, notebook),0);
        main_window.add(notebooks);
        main_window.present();
        main_window.show_all();
    }

    public static int main (string[] args) {
        return new HTTPReq().run (args);
    }
}