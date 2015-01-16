using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer as Timer;

class Position
{
	var my_x;
	var my_y;
	
	function initialize(x, y)
	{
		my_x = x;
		my_y = y;
	}
	
	function east()
	{
		return new Position(my_x + 1, my_y);
	}
	
	function west()
	{
		return new Position(my_x - 1, my_y);
	}
	
	function north()
	{
		return new Position(my_x, my_y - 1);
	}
	
	function south()
	{
		return new Position(my_x, my_y + 1);
	}
}

class Snake
{
	hidden var my_body;
	hidden var my_body_size;
	hidden var my_head;
	hidden var my_tail;
	hidden var my_max_length;
	hidden var my_iter;
	hidden var my_direction;
	
	function initialize(max_length)
	{
		my_body       = new[max_length];
		my_body_size  = 0;
		my_head       = 0;
		my_tail       = 0;
		my_max_length = max_length;
		my_iter       = 0;
		
		//System.print("my_head       = ");
		//System.println(my_head.toString());
		
		//System.print("my_tail       = ");
		//System.println(my_tail.toString());
		
		//System.print("my_max_length = ");
		//System.println(my_max_length.toString());
		
		//System.print("my_body_size  = ");
		//System.println(my_body_size.toString());
		//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	}
	
	function grow(position)
	{
		if (my_body_size == 0)
		{
			//! Base case
			my_body[0]   = position;
			my_head      = 0;
			my_tail      = 0;
			my_body_size = 1;
		}
		else if (my_body_size < my_max_length) 
		{
			//! Push tail back and increase body size
			my_tail 	 += 1;
			my_body_size += 1;
			
			my_body[my_tail] = position; 
		}
		else
		{
			//! TODO: HANDLE ERROR
		}
		
		//System.print("my_head       = ");
		//System.println(my_head.toString());
		
		//System.print("my_tail       = ");
		//System.println(my_tail.toString());
		
		//System.print("my_max_length = ");
		//System.println(my_max_length.toString());
		
		//System.print("my_body_size  = ");
		//System.println(my_body_size.toString());
		//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	}
	
	function move_and_grow(position)
	{
		if (my_head == 0)
		{
			my_head 		 = my_max_length - 1;
			my_body[my_head] = position;
		}
		else
		{
			my_head -= 1;
			my_body[my_head] = position;
		}
		
		my_body_size += 1;
		
		//System.println("= MOVE -=-=-=-=-=-=-=-=-=-=-=-=");
		//System.print("my_head       = ");
		//System.println(my_head.toString());
		
		//System.print("my_tail       = ");
		//System.println(my_tail.toString());
		
		//System.print("my_max_length = ");
		//System.println(my_max_length.toString());
		
		//System.print("my_body_size  = ");
		//System.println(my_body_size.toString());
		//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	}
	
	function move(position)
	{
		if (my_head == 0)
		{
			my_head 		 = my_max_length - 1;
			my_body[my_head] = position;
		}
		else
		{
			my_head -= 1;
			my_body[my_head] = position;
		}
		
		if (my_tail == 0)
		{
			my_tail = my_max_length - 1;
		}
		else
		{
			my_tail -= 1;
		}
		
		//System.println("= MOVE -=-=-=-=-=-=-=-=-=-=-=-=");
		//System.print("my_head       = ");
		//System.println(my_head.toString());
		
		//System.print("my_tail       = ");
		//System.println(my_tail.toString());
		
		//System.print("my_max_length = ");
		//System.println(my_max_length.toString());
		
		//System.print("my_body_size  = ");
		//System.println(my_body_size.toString());
		//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	}
	
	function get_head()
	{
		return my_body[my_head];
	}
	
	function get_body(i)
	{
		//System.print("i = ");
		//System.println(i.toString());
		
		if (my_head + i < my_max_length)
		{
			var index = my_head + i;
			
			//System.print("index = ");
			//System.println(index.toString());
			//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
			return my_body[my_head + i];
		}
		else
		{
			var index = my_head + i - my_max_length;
			
			//System.print("index = ");
			//System.println(index.toString());
			//System.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
			return my_body[index];
		} 
	}
	
	function get_first()
	{
		my_iter = 0;
		return get_head();
	}
	
	function get_size()
	{
		return my_body_size;
	}
	
	function set_direction(direction)
	{
		my_direction = direction;
	}
	
	function get_direction()
	{
		return my_direction;
	}
}

var my_direction;

class SnakeDelegate extends Ui.InputDelegate
{

	function onKey(evt)
	{
		var key     = evt.getKey();
		var handled = false;
		
		if (Ui.KEY_UP == key)
		{
			if (my_direction == :east)
			{
				my_direction = :north;
			}
			else if (my_direction == :north)
			{
				my_direction = :west;
			}
			else if (my_direction == :west)
			{
				my_direction = :south;
			}
			else if (my_direction == :south)
			{
				my_direction = :east;
			}
			else
			{
				System.println("What direction?");
			}
			
			handled = true;
		}
		else if (Ui.KEY_DOWN == key)
		{
			if (my_direction == :east)
			{
				my_direction = :south;
			}
			else if (my_direction == :north)
			{
				my_direction = :east;
			}
			else if (my_direction == :west)
			{
				my_direction = :north;
			}
			else if (my_direction == :south)
			{
				my_direction = :west;
			}
			else
			{
				System.println("What direction?");
			}
			
			handled = true;
		}
		
		return handled;
	}
}



class SnakeView extends Ui.View {

	const BLOCK_SIZE = 8;
	const BLOCK_BORDER_SIZE = 1;
	
	const BOARD_MIN_X = 0;
	const BOARD_MIN_Y = 0;
	const BOARD_MAX_X = 24;
	const BOARD_MAX_Y = 14;
	
	const BOARD_MIN_PXL_X = 2;
	const BOARD_MIN_PXL_Y = 26;

	const SNAKE_MAX_SIZE = 100;

	var gameTimer;
	
	var snake_x;
	var snake_y;
	var snake_dir;
	var snake_size;
	
	var snake = new[SNAKE_MAX_SIZE];
	
	var my_snake;
	var move_count = 0;
	var grow_count = 0;
	
	//! Progress the game
	function tick()
	{
		var head_position;
		
		head_position = my_snake.get_head();			
		
		//! Update the direction if it changed
		if (my_snake.get_direction() != my_direction)
		{
			my_snake.set_direction(my_direction);
		}
		
		//! Move the snake
		if (my_direction == :east)
		{
			my_snake.move(head_position.east());
		}
		else if (my_direction == :north)
		{
			my_snake.move(head_position.north());
		}
		else if (my_direction == :west)
		{
			my_snake.move(head_position.west());
		}
		else if (my_direction == :south)
		{
			my_snake.move(head_position.south());
		}
		
		Ui.requestUpdate();
	}
	
	function drawBlock(dc, x, y) {
		var block_x = BOARD_MIN_PXL_X + (x * BLOCK_SIZE);
		var block_y = BOARD_MIN_PXL_Y + (y * BLOCK_SIZE);
		
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
    	dc.fillRectangle(block_x + BLOCK_BORDER_SIZE, block_y + BLOCK_BORDER_SIZE, BLOCK_SIZE - BLOCK_BORDER_SIZE * 2, BLOCK_SIZE - BLOCK_BORDER_SIZE * 2);
    }

    //! Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.GameLayout(dc));
        
        snake_x = 1;
        snake_y = 0;
        snake_dir = :left;
        
        my_direction = :east;
        
        my_snake = new Snake(100);
        my_snake.grow(new Position(3, 1));
        my_snake.grow(new Position(2, 1));
        my_snake.grow(new Position(1, 1));
        my_snake.set_direction(my_direction);
        
        gameTimer = new Timer.Timer();
        gameTimer.start( method(:tick), 250, true );
        
        
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    
    }

    //! Update the view
    function onUpdate(dc) {
    
    	dc.clear();
    	
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
		
		for (var i = 0; i < my_snake.get_size(); i++)
		{
			var pos = my_snake.get_body(i);
			
			drawBlock(dc, pos.my_x, pos.my_y);	
		}
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }
}