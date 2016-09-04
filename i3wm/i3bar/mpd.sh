#!/bin/bash
if [[ $(mpc current) ]]; then
	    mpc current -f '[%artist%] - [%title%]|[%file%]'
fi
