FROM tensorflow/tensorflow:2.0.1-gpu

COPY . /SynthSeg

RUN pip install --upgrade pip && \
    pip install -r /SynthSeg/requirements.txt

#install models (grabbed from FS 7.3.2 docker container)
RUN curl https://www.dropbox.com/s/i62tzl821mqi3vd/synths_models_freesurfer_7.3.2.zip -Lo synths_models_freesurfer_7.3.2.zip && \
    unzip -o -d /SynthSeg/models  synths_models_freesurfer_7.3.2.zip && rm -f synths_models_freesurfer_7.3.2.zip
    
ENTRYPOINT ["python", "/SynthSeg/scripts/commands/SynthSeg_predict.py"]

