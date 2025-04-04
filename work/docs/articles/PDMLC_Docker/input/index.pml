[doc [title How to Run the PDML Companion in a Docker Container?]

    This document explains how to run the PDML Companion in a Docker container on macOS, Unix/Linux or Windows.

    Two steps are involved:
    [list
        [el create a container]
        [el run the container]
    ]

    [ch [title Creating a Docker Container]

        To create a Docker container for the PDML Companion (PDMLC) command line tool, proceed as follows:

        [list
            [el
                If not done already, [link (url="https://docs.docker.com/get-started/get-docker/") install Docker] (and ensure that your OS complies with the Docker system requirements).
            ]

            [el
                Open a terminal in a directory of your choice, create a working directory (e.g. [c pdml-docker]), and move into that directory, e.g.:
                [input
                    """
                    mkdir pdml-docker
                    cd pdml-docker
                    """
                ]
            ]

            [el
                Create file [c Dockerfile] and copy-paste the following content:
                [caption File Dockerfile]
                [code
                    """
                    FROM openjdk:17-alpine

                    ARG PDML_VERSION=0.79.0

                    WORKDIR /app

                    # Install PDMLC
                    RUN apk update && apk add --no-cache curl
                    RUN curl -O https://github.com/pdml-lang/full-pdml-impl/releases/download/v${PDML_VERSION}/pdmlc-java-app-${PDML_VERSION}.tar
                    RUN tar -xf pdmlc-java-app-${PDML_VERSION}.tar

                    ENV PATH="/app/pdmlc-java-app-${PDML_VERSION}/bin:${PATH}"

                    WORKDIR /

                    CMD ["/bin/sh"]
                    """
                ]
            ]

            [el
                Build a Docker image by typing:
                [input
                    """
                    docker build -t pdmlc .
                    """
                ]
                (Note the required dot at the end of the command)
            ]
        ]
    ]

    [ch [title Running the Container]

        To run PDMLC in a Docker container type:
        [input
            """
            docker run -it pdmlc
            """
        ]

        You can now enter PDMLC commands in the terminal session of the Docker container.

        For example, to get a list of available PDMLC commands, type:
        [input
            """
            pdmlc help
            """
        ]

        [ch [title Useful Options]

            [ch [title Access to Host Files]
            
                If you need read/write access to a directory of your host OS, use the [link (url="https://docs.docker.com/reference/cli/docker/container/run/#volume") [c -v]] option of the Docker [c run] command.

                For example, suppose that you are using Windows, and you want to access files in directory [c C:\\temp\\test\\] from within your Docker container.
                In that case, you can use the [c -v] option as follows:
                [input
                    """
                    docker run -it -v C:\temp\test:/docs pdmlc
                    """
                ]
                This maps [c C:\\temp\\test\\] to directory [c /docs] in your container, so that you can read from and write to [c C:\\temp\\test\\] via [c /docs].
                
                For example, the following PDMLC command (executed in your container), reads file [c C:\\temp\\test\\config.pdml] and creates file [c C:\\temp\\test\\tree_view.html] (which you can open in your standard Windows browser):
                [input
                    """
                    pdmlc p2h /docs/config.pdml /docs/tree_view.html
                    """
                ]
            ]

            [ch [title Container User]

                [note
                    This section applies only to Unix-like host systems — it doesn't apply to Windows.
                ]

                By default, Docker containers run as the [c root] user inside the container, which can cause permission and security issues.

                To specify the user under which the container runs, you can use the [c -u] option of the Docker [c run] command.
                For example, to specify a user with UID 1000 and GID 1000:
                [input
                    """
                    docker run -it -u 1000:1000
                    """
                ]

                Specifying [c -u $(id -u):$(id -g)] ensures the container process runs as the [i current] user (with the same UID and GID as the host user) rather than as [c root]:
                [input
                    """
                    docker run -it -u $(id -u):$(id -g)
                    """
                ]
                The expression [c $(id -u):$(id -g)] is a shell substitution that uses the Unix [c id] command to dynamically fetch the user ID (UID) and group ID (GID) of the current user.
            ]
        ]
    ]
]

