**This file contains instructions concerning how to set up Isaac Lab for reinforcement learning.**

# Isaac Lab Installation
The installation process involves installing Isaac Sim (5.X) and Isaac Lab. Follow the quick installation guide outlined here: https://isaac-sim.github.io/IsaacLab/main/source/setup/quickstart.html#quick-installation-guide

*Note*: Even if you have Isaac Sim installed, make sure to not ignore the _Installing Isaac Sim_ section of the website. This second installation of Isaac Sim is used by Isaac Lab while your original installation is its own standalone app that can be launched.

**To verify your installation:**

Option 1: Using the isaaclab.sh executable (note: this works for both the bundled python and the virtual environment):
```
./isaaclab.sh -p scripts/tutorials/00_sim/create_empty.py
```

Option 2: Using python in your virtual environment:

```
python scripts/tutorials/00_sim/create_empty.py
```

_or try out the reinforcement learning with the ant (add "--headless" to run it in headless mode)_:

```
./isaaclab.sh -p scripts/reinforcement_learning/rsl_rl/train.py --task=Isaac-Ant-v0
```

# Creating a Project

To save time, we will use Nvidia's template generator. Go inside your main Isaac Lab installation folder and let's create a new project:

```
cd <path/to/IsaacLab>
./isaaclab.sh --new 
``` 

Choose _External_, a destination path for the project, the project name, the Isaac Lab workflow you want (see more info on workflows here: https://isaac-sim.github.io/IsaacLab/main/source/overview/core-concepts/task_workflows.html) and the reinforcement learning (RL) libraries/frameworks you want to be able to use for the project.

There is now a folder at the destination you chose with the name of the project you specified. Navigate to that folder and run: 
```
cd <path/to/given-project-name>
python -m pip install -e source/<given-project-name>
```

# Training Robots, Playing Policies
**To find your available environments/task IDs, run the following in your terminal, inside your project folder**:
```
python scripts/list_envs.py
```

**To Train Robots:** Go inside your project's directory and run one of the following.
```
# skrl (PPO by default)
python scripts/skrl/train.py --task=<your_task_ID> --headless
# rsl_rl instead
python scripts/rsl_rl/train.py --task=<your_task_ID> --headless
```
Useful training flags:

* --num_envs N : override env count (default comes from <your_project>_env_cfg.py)
* --headless : no viewport, much faster; drop it if you want to watch training live
* --video --video_length 200 --video_interval 2000 : periodically record training videos
* --max_iterations N : cap training length
* --checkpoint <path> : resume from a checkpoint
* --seed N : reproducibility

**To Play Policies:** Go inside your project's directory and run one of the following:

```
# skrl
python scripts/skrl/play.py --task=<your_task_ID>
# rsl_rl
python scripts/rsl_rl/play.py --task=<your_task_ID>
```
Useful flags:
* --num_envs 4 : loads less envs
* --checkpoint <path/to/checkpoint> : loads a specific checkpoint
