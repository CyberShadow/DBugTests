import std.c.stdlib;
import std.stdio;
import std.string;

import bcd.gtk2.gtk;

/* This is a callback function. The data arguments are ignored
 * in this example. More on callbacks below. */
extern (C) void hello( GtkWidget *widget,
                       gpointer   data )
{
    g_print ("Hello World\n");
}

static gboolean delete_event( GtkWidget *widget,
                              GdkEvent  *event,
                              gpointer   data )
{
    /* If you return FALSE in the "delete_event" signal handler,
     * GTK will emit the "destroy" signal. Returning TRUE means
     * you don't want the window to be destroyed.
     * This is useful for popping up 'are you sure you want to quit?'
     * type dialogs. */

    g_print ("delete event occurred\n");

    /* Change TRUE to FALSE and the main window will be destroyed with
     * a "delete_event". */

    return true;
}

/* Another callback */
static void destroy( GtkWidget *widget,
                     gpointer   data )
{
    gtk_main_quit ();
}

int main( char[][] args )
{
    /* GtkWidget is the storage type for widgets */
    GtkWidget *window;
    GtkWidget *button;

    int fake_args_len = 1;
    char** fake_args;
    fake_args = cast(char **) malloc(8);
    fake_args[0] = toStringz(args[0]);
    fake_args[1] = null;
    gtk_init (&fake_args_len, &fake_args);
    
    /* create a new window */
    window = gtk_window_new (GtkWindowType.GTK_WINDOW_TOPLEVEL);
    
    /* When the window is given the "delete_event" signal (this is given
     * by the window manager, usually by the "close" option, or on the
     * titlebar), we ask it to call the delete_event () function
     * as defined above. The data passed to the callback
     * function is NULL and is ignored in the callback function. */
    g_signal_connect_data (cast(GObject *) (window), "delete_event",
                           cast(GCallback) (&delete_event), null,
                           null, 0);
    
    /* Here we connect the "destroy" event to a signal handler.  
     * This event occurs when we call gtk_widget_destroy() on the window,
     * or if we return FALSE in the "delete_event" callback. */
    g_signal_connect_data (cast(GObject *) (window), "destroy",
                           cast(GCallback) (&destroy), null,
                           null, 0);
    
    /* Sets the border width of the window. */
    gtk_container_set_border_width (cast(GtkContainer *) (window), 10);
    
    /* Creates a new button with the label "Hello World". */
    button = gtk_button_new_with_label ("Hello D!");
    
    /* When the button receives the "clicked" signal, it will call the
     * function hello() passing it NULL as its argument.  The hello()
     * function is defined above. */
    g_signal_connect_data (cast(GObject *) (button), "clicked",
                           cast(GCallback) (&hello), null,
                           null, 0);
    
    /* This will cause the window to be destroyed by calling
     * gtk_widget_destroy(window) when "clicked".  Again, the destroy
     * signal could come from here, or the window manager. */
    g_signal_connect_data (cast(GObject *) (button), "clicked",
                           cast(GCallback) (&gtk_widget_destroy),
                           cast(GObject *) (window),
                           null, GConnectFlags.G_CONNECT_SWAPPED);
    
    /* This packs the button into the window (a gtk container). */
    gtk_container_add (cast(GtkContainer *) (window), button);
    
    /* The final step is to display this newly created widget. */
    gtk_widget_show (button);
    
    /* and the window */
    gtk_widget_show (window);
    
    /* All GTK applications must have a gtk_main(). Control ends here
     * and waits for an event to occur (like a key press or
     * mouse event). */
    gtk_main ();
    
    return 0;
}
